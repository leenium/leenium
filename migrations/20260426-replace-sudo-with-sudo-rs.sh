echo "Replace sudo with sudo-rs (memory-safe Rust reimplementation)"
MIGRATION_VERSION="1.1.1"

# Already done
if pacman -Q sudo-rs &>/dev/null; then
  exit 0
fi

# Ensure /etc/sudoers exists before the swap (sudo-rs requires it)
if [ ! -f /etc/sudoers ]; then
  echo "$USER ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers > /dev/null
  sudo chmod 440 /etc/sudoers
fi

# Disable password character echo (sudo-rs shows * by default)
if ! sudo grep -q '!pwfeedback' /etc/sudoers; then
  sudo sh -c 'echo "Defaults !pwfeedback" >> /etc/sudoers'
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

# Ensure /usr/bin/sudo exists — the package may not place it
if [ ! -f /usr/bin/sudo ] && [ -f /usr/bin/sudo-rs ]; then
  sudo ln -s /usr/bin/sudo-rs /usr/bin/sudo
fi
