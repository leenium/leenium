echo "Rename lock screen command in Hypridle config"
MIGRATION_VERSION="1.2.0"

if grep -q 'leenium-lock-screen' ~/.config/hypr/hypridle.conf; then
  sed -i 's/leenium-lock-screen/leenium-system-lock/g' ~/.config/hypr/hypridle.conf
  leenium-restart-hypridle
fi
