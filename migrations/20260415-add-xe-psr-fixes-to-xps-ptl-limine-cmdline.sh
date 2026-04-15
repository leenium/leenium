echo "Add Xe display power-saving fixes to CMDLINE for XPS Panther Lake systems missing them"
MIGRATION_VERSION="1.0.0"

if leenium-hw-match "XPS" && leenium-hw-intel-ptl && [[ -f /etc/default/limine ]]; then
  missing_args=()

  if ! grep -q 'xe.enable_psr=0' /etc/default/limine; then
    missing_args+=("xe.enable_psr=0")
  fi

  if ! grep -q 'xe.enable_panel_replay=0' /etc/default/limine; then
    missing_args+=("xe.enable_panel_replay=0")
  fi

  if (( ${#missing_args[@]} > 0 )); then
    printf 'KERNEL_CMDLINE[default]+=" %s"\n' "${missing_args[*]}" | sudo tee -a /etc/default/limine >/dev/null

    if command -v limine-mkinitcpio &>/dev/null; then
      sudo limine-mkinitcpio
    fi
  fi
fi
