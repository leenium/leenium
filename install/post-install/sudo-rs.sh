#!/bin/bash

# Ensure /etc/sudoers exists before the swap (sudo-rs requires it)
if [ ! -f /etc/sudoers ]; then
  echo "$USER ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers > /dev/null
  sudo chmod 440 /etc/sudoers
fi

# Ensure PAM config exists for sudo-rs authentication
if [ ! -f /etc/pam.d/sudo ]; then
  sudo tee /etc/pam.d/sudo > /dev/null << 'EOF'
#%PAM-1.0
auth       include        system-auth
account    include        system-auth
session    include        system-auth
EOF
fi

# Atomically swap sudo → sudo-rs in a single root shell to avoid losing sudo mid-script
sudo bash -c "pacman -Rdd --noconfirm sudo && pacman -S --noconfirm sudo-rs"
