LEENIUM_MIGRATIONS_STATE_PATH=~/.local/state/leenium/migrations
LEENIUM_STATE_PATH=~/.local/state/leenium
mkdir -p "$LEENIUM_MIGRATIONS_STATE_PATH"
mkdir -p "$LEENIUM_MIGRATIONS_STATE_PATH/skipped"

if [[ -f $LEENIUM_PATH/version && ! -f $LEENIUM_STATE_PATH/version ]]; then
  mkdir -p "$LEENIUM_STATE_PATH"
  cp "$LEENIUM_PATH/version" "$LEENIUM_STATE_PATH/version"
fi
