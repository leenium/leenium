# Install all base packages
mapfile -t packages < <(grep -v '^#' "$LEENIUM_INSTALL/leenium-base.packages" | grep -v '^$')
leenium-pkg-add "${packages[@]}"
