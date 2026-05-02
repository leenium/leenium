echo "Restore stock kernel on non-XPS Panther Lake systems"
MIGRATION_VERSION="1.2.0"

if leenium-hw-intel-ptl && ! leenium-hw-match "XPS"; then
  leenium-pkg-add linux linux-headers

  for pkg in linux-ptl linux-ptl-headers; do
    sudo pacman -Rdd --noconfirm "$pkg" 2>/dev/null || true
  done

  sudo rm -f /etc/limine-entry-tool.d/intel-panther-lake.conf
  sudo rm -f /etc/limine-entry-tool.d/dell-xps-panther-lake.conf

  if leenium-cmd-present limine-update; then
    sudo limine-update
  fi
fi
