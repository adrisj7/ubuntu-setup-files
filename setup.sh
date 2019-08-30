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


notify "Installing basic stuff"
apt-get -y install vim

notify "Copying over vimrc"
cp ./vimrc ~/.vimrc

notify "Copying over bash aliases"
cp ./bash_aliases ~/.bash_aliases

#notify "Copying over startup script and setting it to run on startup"
#cp ./startupscript.sh /etc/init.d/customstartup.sh
#chmod +x /etc/init.d/customstartup.sh
#update-rc.d customstartup.sh defaults 100

# Download vim-plug.
# TODO: Current plugins aren't added in vimrc. Fix this!
notify "Downloading vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

read -r -p "Install clang? (makes vim clang-complete good, takes a while though)"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main"
    apt-get update
    apt-get install -y clang-6.0
    # Deal with libclang extra .1 file, making a copy
    sudo cp /usr/lib/llvm-6.0/lib/libclang.so.1 /usr/lib/llvm-6.0/lib/libclang.so
fi


notify "Installing vim plugins"
vim +VimEnter +PlugInstall +qall


read -r -p  "Do you have i3 installed? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    notify "Copying over i3 setup file and i3 config file"
    cp ./i3status.conf ~/.i3status.conf

    #Entire i3config folder
    cp ./i3config/* ~/.config/i3
    # Old: Just the i3config
    #cp ./i3config ~/.config/i3/config

    notify "Refreshing/Restarting i3 to apply changes"
    i3-msg reload
    i3-msg restart

    notify "Copying over wallpaper (Is this really necessary?"
    mkdir ~/Pictures/Wallpapers
    cp ./Wallpapers/wallpaper.png ~/Pictures/Wallpapers/wallpaper.png

fi


read -r -p  "Generate SSH Key? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    notify "Generating SSH Keys"
    echo "   Leave everything blank, including the password (unless you want security pshhh)"

    ssh-keygen -t rsa

    echo -e "\e[1mNow, you must COPY over the contents of ~/.ssh/id_rsa.pub and use it for git/ssh authentication\e[0m"
    read -p "Press enter to continue..."
fi
