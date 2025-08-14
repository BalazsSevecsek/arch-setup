#!/bin/bash

set -e 
sudo pacman -S --needed --noconfirm mesa polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-utils gdm || exit 1
sudo pacman -S --needed --noconfirm uwsm hyprland  waybar hyprpaper hyprsunset hyprlock hypridle playerctl hypershot walker mako fcitx5 swaybg swayosd-server || exit 1
# yay -S --needed --noconfirm nerd-fonts-caskaydia-mono

cp  config/hyprland/* ~/.config/hypr/