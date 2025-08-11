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




#zsh
sudo pacman  -S --needed --noconfirm zsh
#if current shell is not zsh, change it to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to zsh..."
  hash -r
  sudo chsh -s /bin/zsh $(whoami)
  yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

