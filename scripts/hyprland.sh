#!/bin/bash

sudo pacman -S --needed --noconfirm mesa polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-utils gdm
sudo pacman -S --needed --noconfirm uwsm hyprland  waybar hyprpaper hyprsunset hyprlock hypridle
yay -S nerd-fonts-caskaydia-mono

cp  config/hyprland/* ~/.config/hypr/