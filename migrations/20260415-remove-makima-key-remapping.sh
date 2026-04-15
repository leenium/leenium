echo "Remove makima key remapping service (Copilot key now handled natively by Hyprland)"
MIGRATION_VERSION="1.0.0"

if systemctl is-enabled makima &>/dev/null; then
  sudo systemctl disable --now makima
fi

sudo rm -rf /etc/systemd/system/makima.service.d
sudo rm -f /etc/udev/rules.d/99-uinput.rules
rm -rf "$HOME/.config/makima"

leenium-pkg-drop makima-bin
