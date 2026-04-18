echo "Add flags sourcing to hyprland.conf"
MIGRATION_VERSION="1.0.0"

HYPR_CONF=~/.config/hypr/hyprland.conf

source "$LEENIUM_PATH/install/config/leenium-toggles.sh"

if [[ -f $HYPR_CONF ]] && ! grep -q "toggles/hypr/\*\.conf" "$HYPR_CONF"; then
  echo -e "\n# Toggle config flags dynamically\nsource = ~/.local/state/leenium/toggles/hypr/*.conf" >> "$HYPR_CONF"
fi
