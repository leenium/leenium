echo "Fix Hyprland toggle glob source and ensure non-hidden toggle flag file"
MIGRATION_VERSION="1.2.0"

HYPR_CONF=~/.config/hypr/hyprland.conf
TOGGLE_SOURCE_LINE="source = ~/.local/state/leenium/toggles/hypr/*.conf"

source "$LEENIUM_PATH/install/config/leenium-toggles.sh"

if [[ -f $HYPR_CONF ]]; then
  if grep -q "^[[:space:]]*#[[:space:]]*source = ~/.local/state/leenium/toggles/hypr/\\\*\\\.conf" "$HYPR_CONF"; then
    sed -i "s|^[[:space:]]*#[[:space:]]*source = ~/.local/state/leenium/toggles/hypr/\\\*\\\.conf|$TOGGLE_SOURCE_LINE|" "$HYPR_CONF"
  elif ! grep -q "toggles/hypr/\\*\\.conf" "$HYPR_CONF"; then
    echo -e "\n# Toggle config flags dynamically\n$TOGGLE_SOURCE_LINE" >> "$HYPR_CONF"
  fi
fi
