echo "Replace coterie of individual Elephant packages with the single elephant-all package"
MIGRATION_VERSION="1.2.0"

if leenium-pkg-present leenium-walker; then
  yes | sudo pacman -S --needed elephant-all
  sudo pacman -R --noconfirm leenium-walker
fi