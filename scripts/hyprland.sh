#!/bin/bash


sudo pacman -S --needed --noconfirm dolphin
sudo pacman -S --needed --noconfirm ghostty
sudo pacman -S --needed --noconfirm foot
sudo pacman -S --needed --noconfirm mesa
sudo pacman -S --needed --noconfirm polkit-kde-agent
sudo pacman -S --needed --noconfirm qt5-wayland
sudo pacman -S --needed --noconfirm qt6-wayland
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland
sudo pacman -S --needed --noconfirm xdg-utils
sudo pacman -S --needed --noconfirm gdm
sudo pacman -S --needed --noconfirm hyprland  
sudo pacman -S --needed --noconfirm waybar
sudo pacman -S --needed --noconfirm hyprpaper
sudo pacman -S --needed --noconfirm hyprsunset
sudo pacman -S --needed --noconfirm hyprlock
sudo pacman -S --needed --noconfirm hypridle
sudo pacman -S --needed --noconfirm playerctl
sudo pacman -S --needed --noconfirm hypershot
sudo pacman -S --needed --noconfirm walker
sudo pacman -S --needed --noconfirm blueman-manager
sudo pacman -S --needed --noconfirm pavucontrol
# sudo pacman -S --needed --noconfirm swayosd-server

# yay -S --needed --noconfirm nerd-fonts-caskaydia-mono

[ ! -d ~/.config/hypr ] && mkdir -p ~/.config/hypr
cp -r config/hyprland/* ~/.config/hypr/

#fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

sudo pacman -S --needed --noconfirm inter-font
sudo pacman -S --needed --noconfirm nerd-fonts-noto-sans
yay -S --needed --noconfirm ttf-ms-win11-segoe

#sound control
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.saivert.pwvucontrol

#bluetooth
sudo pacman -S --needed --noconfirm bluez bluez-utils blueman
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

[ ! -d ~/.config/waybar/ ] && mkdir -p ~/.config/waybar/
cp -r config/waybar/* ~/.config/waybar/


#pomodoro for waybar
# git clone git@github.com:Andeskjerf/waybar-module-pomodoro.git
# cd waybar-module-pomodoro
# cargo build --release