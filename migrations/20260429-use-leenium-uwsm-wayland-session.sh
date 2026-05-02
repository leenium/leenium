echo "Use Leenium UWSM session without graphical.target startup wait"
MIGRATION_VERSION="1.2.0"

sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$LEENIUM_PATH/default/wayland-sessions/leenium.desktop" /usr/local/share/wayland-sessions/leenium.desktop

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Session=hyprland-uwsm$/Session=leenium/' /etc/sddm.conf.d/autologin.conf
fi
