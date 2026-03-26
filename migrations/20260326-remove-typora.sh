echo "Remove Typora packages, launchers, themes, and keybindings"
MIGRATION_VERSION="1.0.0"

leenium-pkg-drop typora

rm -f "$HOME/.local/share/applications/typora.desktop"
rm -f "$HOME/.config/Typora/themes/ia_typora.css"
rm -f "$HOME/.config/Typora/themes/ia_typora_night.css"

if [[ -f $HOME/.config/hypr/bindings.conf ]]; then
  sed -i '/Typora, exec, uwsm-app -- typora --enable-wayland-ime/d' "$HOME/.config/hypr/bindings.conf"
fi

if [[ -d $HOME/.local/share/applications ]]; then
  update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
fi

if [[ -n $HYPRLAND_INSTANCE_SIGNATURE ]]; then
  hyprctl reload >/dev/null 2>&1 || true
fi
