# Bash aliases file


alias ssh-caen='ssh adris@login.engin.umich.edu'
alias untar='tar -xvzf'
alias untar-nozip='tar -xvf'

# Installs a deb file
function undeb(){
    sudo dpkg -i "$1"
    sudo apt-get install -f
}

alias control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias ycm-config='~/.vim/plugged/YCM-Generator/config_gen.py'
alias xclip-copyfile-real='xclip -sel clip'
alias vscode='code'

# Programs
alias processing='~/Programs/processing-3.4/processing'
alias arduino='~/Programs/arduino-1.8.7/arduino'
alias eclipse='~/Programs/eclipse-4.7/eclipse'

# Hugo post, creates a new post and opens it for editing.
function hpost(){
    hugo new post/"$1" && vim content/post/"$1"
}
