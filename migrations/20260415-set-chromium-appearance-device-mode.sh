echo "Set Chromium appearance mode to device (follow system) by default"
MIGRATION_VERSION="1.0.0"

initial_preferences_path="/usr/lib/chromium/initial_preferences"
initial_preferences_tmp=$(mktemp)

cat >"$initial_preferences_tmp" <<'EOF'
{"browser":{"theme":{"color_scheme":0}}}
EOF

if ! sudo test -f "$initial_preferences_path" || ! sudo cmp -s "$initial_preferences_tmp" "$initial_preferences_path"; then
  sudo install -Dm644 "$initial_preferences_tmp" "$initial_preferences_path"
fi

rm -f "$initial_preferences_tmp"

if ! command -v jq &>/dev/null; then
  exit 0
fi

shopt -s nullglob

for prefs in "$HOME/.config/chromium/Default/Preferences" "$HOME/.config/chromium"/Profile\ */Preferences; do
  [[ -f $prefs ]] || continue

  prefs_tmp=$(mktemp)

  if jq '.browser.theme.color_scheme = 0' "$prefs" >"$prefs_tmp"; then
    if cmp -s "$prefs_tmp" "$prefs"; then
      rm -f "$prefs_tmp"
    else
      mv "$prefs_tmp" "$prefs"
    fi
  else
    rm -f "$prefs_tmp"
  fi
done
