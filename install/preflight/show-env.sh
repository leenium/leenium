# Show installation environment variables
gum style --foreground "${LEENIUM_COLOR_ACCENT:-#35d6a0}" "Installation Environment:"

env | grep -E "^(LEENIUM_CHROOT_INSTALL|LEENIUM_ONLINE_INSTALL|LEENIUM_USER_NAME|LEENIUM_USER_EMAIL|USER|HOME|LEENIUM_REPO|LEENIUM_REF|LEENIUM_PATH)=" | sort | while IFS= read -r var; do
  gum style --foreground "${LEENIUM_COLOR_MUTED:-#8cb7a9}" "  $var"
done
