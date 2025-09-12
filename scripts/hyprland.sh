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
sudo pacman -S --needed --noconfirm brightnessctl
sudo usermod -aG video $USER
sudo pacman -S --needed --noconfirm jq grim slurp wl-clipboard libnotify cliphist
yay -S --needed --noconfirm hyprshot
sudo pacman -S --needed --noconfirm hypridle
sudo pacman -S --needed --noconfirm hyprsunset
sudo pacman -S --needed --noconfirm hyprpolkitagent
sudo pacman -S --needed --noconfirm playerctl
sudo pacman -S --needed --noconfirm seahorse
#notification manager
sudo pacman -S --needed --noconfirm mako
#screen sharing and audio
sudo pacman -S --needed --noconfirm pipewire wireplumber
sudo pacman -S --needed --noconfirm  gtk4 gtk4-layer-shell protobuf protobuf-c 
#app launcher
yay -S --needed --noconfirm elephant walker
sudo pacman -S --needed --noconfirm htop
#wifi control
sudo pacman -S --needed --noconfirm networkmanager network-manager-apple
yay -S --needed --noconfirm networkmanager-dmenu-git

[ ! -d ~/screenshots ] && mkdir -p ~/screenshots
echo "Created screenshots folder"

[ ! -d ~/.config/hypr ] && mkdir -p ~/.config/hypr
cp -r config/hyprland/* ~/.config/hypr/

#fonts
yay -S --needed --noconfirm nerd-fonts

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

[ ! -d ~/.config/networkmanager-dmenu/ ] && mkdir -p ~/.config/networkmanager-dmenu/
cp -r config/networkmanager-dmenu/* ~/.config/networkmanager-dmenu/

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
systemctl --user enable --now waybar.service
#Authentication agent for apps asking for password
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now gnome-keyring-daemon.service
systemctl --user enable --now NetworkManager