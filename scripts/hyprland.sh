#!/bin/bash

yay -S --needed --noconfirm ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender libxcursor pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang-git hyprcursor-git hyprwayland-scanner-git xcb-util-errors hyprutils-git glaze hyprgraphics-git aquamarine-git re2 hyprland-qtutils
sudo pacman -S --needed --noconfirm hyprland
sudo pacman -S --needed --noconfirm wayland xorg-xwayland wl-clipboard mesa xdg-desktop-portal xdg-desktop-portal-wlr foot greetd
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland hyprpaper waybar

