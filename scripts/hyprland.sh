#!/bin/bash


sudo pacman -S --needed --noconfirm dolphin
sudo pacman -S --needed --noconfirm ghostty
sudo pacman -S --needed --noconfirm foot
sudo pacman -S --needed --noconfirm mesa
sudo pacman -S --needed --noconfirm qt5-wayland
sudo pacman -S --needed --noconfirm qt6-wayland
sudo pacman -S --needed --noconfirm hyprland  
sudo pacman -S --needed --noconfirm uwsm libnewt
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland
sudo pacman -S --needed --noconfirm waybar
sudo pacman -S --needed --noconfirm hyprpaper
sudo pacman -S --needed --noconfirm hyprlock
sudo pacman -S --needed --noconfirm hypershot
sudo pacman -S --needed --noconfirm hypridle
sudo pacman -S --needed --noconfirm hyprsunset
sudo pacman -S --needed --noconfirm hyprpolkitagent
sudo pacman -S --needed --noconfirm playerctl
#notification manager
sudo pacman -S --needed --noconfirm mako
#screen sharing and audio
sudo pacman -S --needed --noconfirm pipewire wireplumber
sudo pacman -S --needed --noconfirm  gtk4 gtk4-layer-shell protobuf protobuf-c 
#app launcher
yay -S --needed --noconfirm elephant walker
sudo pacman -S --needed --noconfirm htop

[ ! -d ~/.config/hypr ] 
mkdir -p ~/.config/hypr

cp -r config/hyprland/* ~/.config/hypr/

#fonts
# [ ! -d ~/nerd-fonts ]
# git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
# source ~/nerd-fonts/install.sh

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


#add the following to shell profile
ZSHRC="$HOME/.zshrc"
BLOCK='if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi'

# Check if block already exists in .zshrc
if ! grep -q "uwsm start hyprland-uwsm.desktop" "$ZSHRC"; then
    printf "\n# Start Hyprland with UWSM\n%s\n" "$BLOCK" >> "$ZSHRC"
    echo "✅ Added Hyprland start block to $ZSHRC"
else
    echo "info: Hyprland start block already present in $ZSHRC"
fi


[ ! -d ~/.config/mako/ ] && mkdir -p ~/.config/mako/
cp -r config/mako/* ~/.config/mako/


#enable services 
systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprsunset.service
#Authentication agent for apps asking for password
systemctl --user enable --now hyprpolkitagent.service
# systemctl --user enable --now xdg-desktop-portal-hyprland