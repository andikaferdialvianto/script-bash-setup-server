#!/bin/bash

animate_message() {
  local message=$1
  local delay=$2
  local spin='-\|/'

  for i in $(seq 1 10); do
    printf "\r$message ${spin:i++%${#spin}:1}"
    sleep "$delay"
  done
  echo
}

DELAY=0.1

animate_message "Setting up server..." "$DELAY"
animate_message "Setting up server... 🌐" "$DELAY"
animate_message "Setting up server... 🔄" "$DELAY"
animate_message "Setting up server... 📦" "$DELAY"
animate_message "Setting up server... 🚀" "$DELAY"
animate_message "Setting up server... ✅" "$DELAY"

sudo timedatectl set-timezone Asia/Jakarta

animate_message "Updating and upgrading packages..." "$DELAY"
sudo apt update
sudo apt upgrade -y

animate_message "Installing required packages..." "$DELAY"
sudo apt install git curl zip python3 python3-pip -y

animate_message "Installing Docker..." "$DELAY"

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

animate_message "Server setup completed. ✨" "$DELAY"

echo "You're all set! Enjoy your new server environment."
