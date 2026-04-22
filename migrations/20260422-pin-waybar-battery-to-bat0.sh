echo "Pin waybar battery module to BAT0 to prevent crash on HID battery disconnect"
MIGRATION_VERSION="1.0.0"

CONFIG_FILE=~/.config/waybar/config.jsonc

if [[ -f "$CONFIG_FILE" ]] \
  && ! grep -Eq '"bat"[[:space:]]*:' "$CONFIG_FILE" \
  && grep -Eq '"battery"[[:space:]]*:[[:space:]]*\{' "$CONFIG_FILE"; then
  sed -i -E '/"battery"[[:space:]]*:[[:space:]]*\{/a\    "bat": "BAT0",' "$CONFIG_FILE"
  leenium-restart-waybar
fi
