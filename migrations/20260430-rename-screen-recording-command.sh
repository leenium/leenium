echo "Rename screen recording command"
MIGRATION_VERSION="1.2.0"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'leenium-capture-screencording' "$WAYBAR_CONFIG"; then
  sed -i 's/leenium-capture-screencording/leenium-capture-screenrecording/g' "$WAYBAR_CONFIG"
  leenium-restart-waybar
fi
