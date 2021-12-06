#!/bin/bash
# tested on ubuntu 20.04
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install xfce4 xfce4-goodies -y
window_size="1024,800";
# default dm
sudo echo '/usr/sbin/lightdm' > /etc/X11/default-display-manager
echo "set shared/default-x-display-manager lightdm" | sudo debconf-communicate


######## TO Install Browsers ########
#to install chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install fonts-liberation xdg-utils -y
sudo dpkg -i google-chrome-stable_current_amd64.deb

#to install opera
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
#sudo apt install opera-stable -y

#to install chrome-unstable 
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install google-chrome-unstable -y

#to install chromium
sudo apt install chromium-browser -y

#to install vivaldi
wget -qO- http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] http://repo.vivaldi.com/stable/deb/ stable main"
sudo apt install vivaldi-stable -y
######## ######## ######## ########

sudo useradd -m -r -G sudo -s /bin/bash -U chrome
echo "chrome:rDTGx52Y43Ck2H2j" | sudo chpasswd
sudo timedatectl set-timezone Asia/Kolkata
echo "chrome ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo mkdir /home/chrome/.ssh
sudo cp ~/.ssh/authorized_keys /home/chrome/.ssh/
sudo chown chrome:chrome /home/chrome/.ssh/authorized_keys
# autologin
sudo groupadd -r autologin
sudo gpasswd -a chrome autologin
sudo gpasswd -a chrome nopasswdlogin
sudo cat > /etc/lightdm/lightdm.conf <<EOF
[SeatDefaults]
pam-service=lightdm
pam-autologin-service=lightdm-autologin
session-wrapper=/etc/X11/Xsession
greeter-session=lightdm-greeter
autologin-user=chrome
autologin-user-timeout=0
autologin-session=xfce
EOF
# x2go
sudo apt-get install x2goserver x2goserver-xsession -y
sudo systemctl enable --now x2goserver
sudo mkdir /home/chrome/.config/autostart
sudo chown -R chrome:chrome /home/chrome/.config/autostart
# chrome as default
sudo xdg-mime default google-chrome.desktop x-scheme-handler/http
sudo xdg-mime default google-chrome.desktop x-scheme-handler/https
sudo xdg-mime default google-chrome.desktop text/html
sudo chown -R chrome:chrome /home/chrome
# start lightdm
sudo systemctl set-default graphical.target
sudo unlink /etc/systemd/system/display-manager.service
sudo ln -s /lib/systemd/system/lightdm.service /etc/systemd/system/display-manager.service
sudo systemctl enable lightdm
sudo systemctl start lightdm
sudo xfce4-power-manager -q
# chrome on login
sudo mkdir -p /home/chrome/.config/autostart
sudo cat >  /home/chrome/.config/autostart/google-chrome.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=google-chrome
Comment=Google Chrome
Exec=/usr/bin/google-chrome-stable -no-default-browser-check -no-first-run --password-store=basic  --start-maximized --load-extension="/home/chrome/git_file/tab-control-new"
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOF