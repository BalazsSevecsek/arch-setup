#!/bin/bash
sudo pacman -S --needed --noconfirm gnome-keyring libsecret
systemctl --user enable gnome-keyring-daemon.service
systemctl --user start gnome-keyring-daemon.service