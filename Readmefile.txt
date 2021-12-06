1: Login the server using putty and password and give below commads.
make sure you logged in as root, to know the username give command.

    whoami 

2:If you are root execute below commands.

    sudo apt-get update
    sudo apt install git-all
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3

3:Once it is done, execute below commad

    git clone https://tatanithin007:gitclone22@github.com/tatanithin007/alibaba-cloud.git

4:after files got downloaded, use below commands

    cd alibaba-cloud

5:Out of 4 scripts (4_browsers_desktop.sh,4_browsers_mobile.sh,chrome_desktop.sh,chrome_mobile.sh)
 choose the required script and run below commands

 If you want to install 4 browsers with desktop run command:
    sh 4_browsers_desktop.sh
 If you want to install 4 browsers with mobile run command:
    sh 4_browsers_mobile.sh
 If you want to install 1 browsers with desktop run command:
    sh chrome_desktop.sh
 If you want to install 1 browsers with mobile run command:
    sh chrome_mobile.sh

6:Once above script got succedded run below cmmands, else take a screenshot of failure

This is to install autocontroll

    sh autocontroll.sh {device_id}
    example: if you want to have dev1 as deviceid the command is  sh autocontroll.sh dev1

7: Now to extract the extension ids
    pip3 install -r requirements.txt
    python3 get_extension_id.py
These will print the extension ids.

