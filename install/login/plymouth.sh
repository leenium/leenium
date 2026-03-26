if [[ $(plymouth-set-default-theme) != "leenium" ]]; then
  sudo cp -r "$HOME/.local/share/leenium/default/plymouth" /usr/share/plymouth/themes/leenium/
  sudo plymouth-set-default-theme leenium
fi
