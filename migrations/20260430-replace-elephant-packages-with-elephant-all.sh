echo "Replace coterie of individual Elephant packages with the single elephant-all package"
MIGRATION_VERSION="1.2.0"

if leenium-pkg-present leenium-walker; then
  leenium-pkg-drop leenium-walker
  leenium-pkg-add walker elephant-all
  leenium-refresh-walker
fi
