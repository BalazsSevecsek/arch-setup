#!/bin/bash


#package manager
#install yay if it is not already installed
if ! pacman -Q yay &>/dev/null; then
  sudo pacman -S --needed  --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
else
  echo "yay is already installed."
fi

#GPU drivers 
# Detect GPU vendor
GPU_VENDOR="none"
if lspci | grep -i 'nvidia' &> /dev/null; then
    GPU_VENDOR="nvidia"
elif lspci | grep -i 'amd/ati' &> /dev/null; then
    GPU_VENDOR="amd"
fi

echo "Detected GPU vendor: $GPU_VENDOR"

# Install drivers based on detected vendor
case $GPU_VENDOR in
  nvidia)
    echo "Installing Nvidia drivers..."
    pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
    # Optionally install dkms for kernel module auto rebuild
    pacman -S --noconfirm dkms
    ;;
  amd)
    echo "Installing AMD drivers..."
    # AMD GPU open source drivers are part of mesa
    pacman -S --noconfirm xf86-video-amdgpu mesa
    ;;
  *)
    echo "No Nvidia or AMD GPU detected, skipping driver installation."
    ;;
esac

# Regenerate initramfs if Nvidia drivers installed (to include kernel modules)
if [ "$GPU_VENDOR" == "nvidia" ]; then
    echo "Regenerating initramfs..."
    mkinitcpio -P
fi

echo "Driver installation script finished."

#zsh
sudo pacman  -S --needed --noconfirm zsh
#if current shell is not zsh, change it to zsh
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Changing default shell to zsh..."
  hash -r
  sudo chsh -s /bin/zsh $(whoami)
  yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


source ./keepassxc.sh
sudo pacman -S --needed --noconfirm flatpak
yay -Sy -needed --noconfirm brave-bin
