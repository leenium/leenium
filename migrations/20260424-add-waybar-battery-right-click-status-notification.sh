echo "Show battery status notification on right-click of the waybar battery icon"
MIGRATION_VERSION="1.1.1"

CONFIG_FILE=~/.config/waybar/config.jsonc

if [[ -f "$CONFIG_FILE" ]] \
  && ! grep -Eq '"on-click-right"[[:space:]]*:[[:space:]]*"notify-send -u low \\"\$\(leenium-battery-status\)\\""' "$CONFIG_FILE" \
  && grep -Eq '"battery"[[:space:]]*:[[:space:]]*\{' "$CONFIG_FILE"; then
  sed -i '/"on-click": "leenium-menu power",/a\    "on-click-right": "notify-send -u low \\"$(leenium-battery-status)\\"",' "$CONFIG_FILE"
  leenium-restart-waybar
fi
