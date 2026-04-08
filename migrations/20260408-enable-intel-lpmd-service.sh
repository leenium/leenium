echo "Enable Intel LPMD service if installed"
MIGRATION_VERSION="1.0.0"

if pacman -Q intel-lpmd &>/dev/null; then
  sudo systemctl enable --now intel_lpmd.service
fi
