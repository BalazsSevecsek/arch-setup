#!/bin/bash

#if the folder of yay does not exist, clone it and install the binary package
if ! pacman -Q yay &>/dev/null; then
  sudo pacman -S --needed  --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si
  cd ..
  rm -rf yay-bin
else
  echo "yay is already installed."
fi



