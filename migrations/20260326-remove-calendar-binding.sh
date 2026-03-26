echo "Remove the old Calendar keybinding from Hypr"
MIGRATION_VERSION="1.0.0"

if [[ -f $HOME/.config/hypr/bindings.conf ]]; then
  sed -i '/Calendar, exec, leenium-launch-or-focus \^thunderbird\$ "uwsm-app -- thunderbird"/d' "$HOME/.config/hypr/bindings.conf"
fi

if [[ -n $HYPRLAND_INSTANCE_SIGNATURE ]]; then
  hyprctl reload >/dev/null 2>&1 || true
fi
