#!/bin/bash
# Update the list of packages
dev_id = $1
echo ' hello "$dev_id"'
sudo apt-get update
sudo useradd -m -r -G sudo -s /bin/bash -U chrome
echo "root:rDTGx52Y43Ck2H2j" | sudo chpasswd
echo "chrome:rDTGx52Y43Ck2H2j" | sudo chpasswd
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell
apt install -y python3-pip
sudo apt install -y xvfb
sudo apt install -y chromium-chromedriver
cp /usr/lib/chromium-browser/chromedriver /usr/bin
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable
wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
apt install unzip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
sudo mkdir /track
sudo mkdir /log
sudo mkdir /files
git clone https://tatanithin007:gitclone22@github.com/tatanithin007/linode.git
cd linode
sudo pip3 install -r requirements.txt
cp * /
cd /
sudo mkdir config
#cp config.json config/config.json
echo "{
    'apiUrl':'https://msbauthentication.com/autocontrol/api/getdevicecampaignuplfile.php?deviceid=$1',
    'apiKey':'',
'startupscript':'index.py',
    'scriptlocation':'/files',
    'lfolder':'/log',
    'lfile':'api.log',
    'searchstring':'Yes',
    'trackfolder':'/track',
    'pyjobtracklog':'pyjobtrack.log'
}" > config/config.json  
(crontab -l 2>/dev/null; echo "@reboot rm -R /files/*") | crontab -
(crontab -l 2>/dev/null; echo "@reboot rm -R /track/*") | crontab -  
(crontab -l 2>/dev/null; echo "* * * * * pwsh /getdatafromapi.ps1") | crontab -
(crontab -l 2>/dev/null; echo "* * * * * pwsh /trackpyjob.ps1") | crontab -