#!/bin/bash

notify () {
    echo -e "\e[1;36m======$1======\e[0m"
}


notify "Installing stuff"
apt-get -y install vim

notify "Copying over vimrc"
cp ./vimrc ~/.vimrc

notify "Copying over startup script and setting it to run on startup"
cp ./startupscript.sh /etc/init.d/customstartup.sh
chmod +x /etc/init.d/customstartup.sh
update-rc.d customstartup.sh defaults 100

notify "Copying over i3 setup file and i3 config file"
cp ./i3status.conf ~/.i3status.conf
cp ./i3config ~/.config/i3/config

notify "Refreshing/Restarting i3 to apply changes"
i3-msg reload
i3-msg restart
