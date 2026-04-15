echo "Disable the XDG autostart entry for Fcitx5 and refresh XCompose"
MIGRATION_VERSION="1.0.0"

source_file="$LEENIUM_PATH/config/autostart/org.fcitx.Fcitx5.desktop"
target_dir="$HOME/.config/autostart"
target_file="$target_dir/org.fcitx.Fcitx5.desktop"

if [[ ! -f $source_file ]]; then
  exit 0
fi

mkdir -p "$target_dir"

if [[ ! -f $target_file ]] || ! cmp -s "$source_file" "$target_file"; then
  cp "$source_file" "$target_file"
  leenium-restart-xcompose
fi
