#!/bin/bash

notify () {
    echo -e "\e[1;36m======$1======\e[0m"
}


notify "I assume you have git installed already..."
echo "\n\n"

notify "Handling git stuff"
git config --global user.email "adrisj7@gmail.com"
git config --global user.name "Adris"
git config --global push.default simple


notify "Installing stuff"
apt-get -y install vim

notify "Copying over vimrc"
cp ./vimrc ~/.vimrc

#notify "Copying over startup script and setting it to run on startup"
#cp ./startupscript.sh /etc/init.d/customstartup.sh
#chmod +x /etc/init.d/customstartup.sh
#update-rc.d customstartup.sh defaults 100

notify "Copying over i3 setup file and i3 config file"
cp ./i3status.conf ~/.i3status.conf
cp ./i3config ~/.config/i3/config

notify "Refreshing/Restarting i3 to apply changes"
i3-msg reload
i3-msg restart


read -r -p  "Generate SSH Key? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	notify "Generating SSH Keys"
	echo "   Leave everything blank, including the password (unless you want security pshhh)"

    ssh-keygen -t rsa

    echo -e "\e[1mNow, you must COPY over the contents of ~/.ssh/id_rsa.pub and use it for git/ssh authentication\e[0m"
    read -p "Press enter to continue..."
fi
