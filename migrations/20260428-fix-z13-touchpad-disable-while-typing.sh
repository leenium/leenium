echo "Fix disable-while-typing on ASUS ROG Flow Z13 detachable keyboard"
MIGRATION_VERSION="1.1.2"

source "$LEENIUM_PATH/install/config/hardware/asus/fix-z13-touchpad.sh"

if [[ -f /etc/udev/rules.d/99-leenium-asus-z13-touchpad.rules ]]; then
  leenium-state set reboot-required
fi
