echo "Hide shutdown console messages behind Plymouth"
MIGRATION_VERSION="1.2.0"

if [[ -f /etc/default/limine ]]; then
  sudo sed -i 's/ quiet splash/ quiet splash loglevel=0 systemd.show_status=false rd.udev.log_level=0 vt.global_cursor_default=0/' /etc/default/limine

  if leenium-cmd-present limine-mkinitcpio; then
    sudo limine-mkinitcpio
  fi
fi
