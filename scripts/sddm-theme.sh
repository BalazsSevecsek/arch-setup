#!/bin/bash

sudo pacman -S --needed --noconfirm sddm #welcome screen
sudo systemctl enable sddm
git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM ~/SilentSDDM && cd SilentSDDM && ./install.sh