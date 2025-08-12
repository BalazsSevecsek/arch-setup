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

#AMD drivers 
if lspci | grep -i "vga" | grep -i "amd"; then
  sudo pacman -S --needed --noconfirm mesa
  echo "AMD GPU detected, installing AMD drivers."
else
  echo "No AMD GPU detected, installing nvidia."
  sudo pacman -S --needed --noconfirm nvidia nvidia-utils  # if Nvidia GPU
fi  


#zsh
sudo pacman  -S --needed --noconfirm zsh
#if current shell is not zsh, change it to zsh
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Changing default shell to zsh..."
  hash -r
  sudo chsh -s /bin/zsh $(whoami)
  yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

