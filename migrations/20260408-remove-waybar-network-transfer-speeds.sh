echo "Remove misleading waybar network transfer speeds"
MIGRATION_VERSION="1.0.0"

if [[ -f $HOME/.config/waybar/config.jsonc ]] && grep -q "bandwidthDownBytes" "$HOME/.config/waybar/config.jsonc"; then
  sed -i 's/"tooltip-format-wifi": "{essid} ({frequency} GHz)\\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}"/"tooltip-format-wifi": "{essid} ({frequency} GHz)"/' "$HOME/.config/waybar/config.jsonc"
  sed -i 's/"tooltip-format-ethernet": "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}"/"tooltip-format-ethernet": "Connected"/' "$HOME/.config/waybar/config.jsonc"
  leenium-restart-waybar
fi
