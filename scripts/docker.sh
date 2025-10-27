#!/bin/bash

sudo pacman -S --needed --noconfirm  docker docker-compose
yay -S docker-desktop
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker
sudo usermod -aG docker $USER
