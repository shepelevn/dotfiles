#!/bin/bash

rm_if_link(){
    if [ -L "$1" ]; then
        rm -iv "$1"
    else
        echo "$1 is not a symbolic link. Skipping."
    fi
}

rm_if_link ~/.vimrc
rm_if_link ~/.bashrc
rm_if_link ~/.bashrc.d
rm_if_link ~/.inputrc
rm_if_link ~/.gitconfig
rm_if_link ~/.config/nvim
rm_if_link ~/.crontab
rm_if_link ~/.anacron
rm_if_link ~/.myclirc
rm_if_link ~/.psqlrc
