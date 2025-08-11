#!/bin/bash

#package manager yay
sudo pacman -S --needed --noconfirm git base-devel 
#if the folder of yay does not exist, clone it
if [ ! -d "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay 
    makepkg -si && cd ~
    rmdir yay
fi




