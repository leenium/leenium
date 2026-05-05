echo "Add cliamp music TUI player (Super+Shift+Alt+M)"
MIGRATION_VERSION="1.2.0"

if leenium-pkg-missing cliamp; then
  leenium-pkg-add cliamp

  cp ~/.local/share/leenium/applications/icons/Cliamp.png ~/.local/share/applications/icons/Cliamp.png
  gtk-update-icon-cache ~/.local/share/icons/hicolor &>/dev/null
  leenium-tui-install "Cliamp" "cliamp" tile "$HOME/.local/share/applications/icons/Cliamp.png"

  if [[ -f ~/.config/hypr/bindings.conf ]] && ! grep -q "cliamp" ~/.config/hypr/bindings.conf; then
    sed -i '/^bindd = SUPER SHIFT, M, Music, exec, leenium-launch-or-focus spotify/a bindd = SUPER SHIFT ALT, M, Music TUI, exec, leenium-launch-or-focus-tui cliamp' ~/.config/hypr/bindings.conf
  fi
fi
