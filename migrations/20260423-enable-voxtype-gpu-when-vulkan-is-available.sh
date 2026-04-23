echo "Enable GPU in voxtype when Vulkan is available"
MIGRATION_VERSION="1.1.1"

if leenium-cmd-present voxtype; then
  if leenium-hw-vulkan; then
    echo "Vulkan is available, enabling GPU in voxtype"
    sudo voxtype setup gpu --enable || true
  fi

  # Earlier voxtype releases hard-coded the non-GPU backend in the user service,
  # so re-run setup to point systemd at /usr/bin/voxtype via the symlink.
  voxtype setup systemd

  systemctl --user restart voxtype
  leenium-restart-waybar
fi
