#!/bin/bash

sudo pacman -S --needed --noconfirm timeshift grub-btrfs
yay -S --needed --noconfirm timeshift-autosnap

#enable timeshift
sudo timeshift --btrfs

#copy timeshift-autosnap.conf to /etc
sudo cp ./config/timeshift-autosnap/timeshift-autosnap.conf /etc/timeshift-autosnap.conf


# Check if ExecStart line already contains the desired configuration
if ! grep -q "ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto" /etc/systemd/system/grub-btrfsd.service; then
    # Use sed to replace ExecStart line in the service file
    sudo sed -i '/ExecStart=/c\ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto' /etc/systemd/system/grub-btrfsd.service
    # Reload systemd to apply changes
    sudo systemctl daemon-reload
    # Restart the service to use new configuration
    sudo systemctl restart grub-btrfsd.service
fi

#enable grub-btrfsd
sudo systemctl enable --now grub-btrfsd

#enable timeshift-autosnap
sudo timeshift-autosnap
