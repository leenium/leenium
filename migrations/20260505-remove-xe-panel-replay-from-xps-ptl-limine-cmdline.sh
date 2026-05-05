echo "Remove stale Xe Panel Replay kernel cmdline from Dell XPS Panther Lake systems"
MIGRATION_VERSION="1.2.0"

DEFAULT_LIMINE="/etc/default/limine"

if leenium-hw-match "XPS" && leenium-hw-intel-ptl; then
  if [[ -f $DEFAULT_LIMINE ]] && grep -q 'xe\.enable_panel_replay' "$DEFAULT_LIMINE"; then
    sudo sed -i '/^KERNEL_CMDLINE.*xe\.enable_panel_replay/d' "$DEFAULT_LIMINE"
    sudo limine-update
  fi
fi
