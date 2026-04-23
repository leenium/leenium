echo "Install the internal monitor recovery user service"
MIGRATION_VERSION="1.1.1"

SERVICE="leenium-recover-internal-monitor.service"
SOURCE="$LEENIUM_PATH/config/systemd/user/$SERVICE"
TARGET_DIR="$HOME/.config/systemd/user"

if [[ ! -f $SOURCE ]]; then
  exit 0
fi

mkdir -p "$TARGET_DIR"
cp "$SOURCE" "$TARGET_DIR/$SERVICE"

systemctl --user daemon-reload
systemctl --user enable "$SERVICE"
