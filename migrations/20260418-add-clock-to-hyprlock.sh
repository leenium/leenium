echo "Add time and date labels to hyprlock"
MIGRATION_VERSION="1.0.0"

HYPRLOCK_CONF=~/.config/hypr/hyprlock.conf

if [[ ! -f $HYPRLOCK_CONF ]]; then
  exit 0
fi

if grep -q 'date\|%H:%M' "$HYPRLOCK_CONF"; then
  exit 0
fi

cat >> "$HYPRLOCK_CONF" <<'EOF'

label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%H:%M")"
    color = $font_color
    font_size = 96
    font_family = JetBrainsMono Nerd Font
    position = 0, 220
    halign = center
    valign = center
    shadow_passes = 0
}

label {
    monitor =
    text = cmd[update:60000] echo "$(date +"%A, %B %d")"
    color = $font_color
    font_size = 28
    font_family = JetBrainsMono Nerd Font
    position = 0, 130
    halign = center
    valign = center
    shadow_passes = 0
}
EOF
