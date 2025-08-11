#!/bin/bash

#package manager
#install yay if it is not already installed
if ! pacman -Q yay &>/dev/null; then
  sudo pacman -S --needed  --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
else
  echo "yay is already installed."
fi



