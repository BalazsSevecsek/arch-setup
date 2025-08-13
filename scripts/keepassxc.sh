sudo pacman -S --noconfirm keepassxc
sudo pacman -S --needed --noconfirm rclone

rclone config create gdrive drive \
  service_account_file=/path/to/rclone-service-account.json \
  scope=drive \
  config_is_local=false \
  --non-interactive