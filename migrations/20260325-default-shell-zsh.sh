echo "Switch the default interactive shell setup to zsh"
MIGRATION_VERSION="1.0.0"

cp "$LEENIUM_PATH/default/zshrc" "$HOME/.zshrc"
cp "$LEENIUM_PATH/default/zprofile" "$HOME/.zprofile"

if [[ $SHELL != "/bin/zsh" ]]; then
  echo "Run 'chsh -s /bin/zsh' to make zsh the login shell for new terminal and tmux sessions."
fi
