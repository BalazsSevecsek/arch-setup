#!/bin/bash


sudo pacman -S --needed --noconfirm vim nvim lazygit

#backup existing nvim config if any

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

if [ ! -d ~/.config/nvim ]; then
    git clone https://github.com/LazyVim/starter ~/.config/nvim
fi

rm -rf ~/.config/nvim/.git