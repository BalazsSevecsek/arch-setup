#!/bin/bash

sudo pacman -S --noconfirm --needed tmux 

if [ ! -f ~/.tmux.conf ]; then
  cp config/.tmux.conf ~/.tmux.conf
fi

#tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
