echo "Ensure xe.enable_psr=0 is set in CMDLINE for XPS Panther Lake systems"
MIGRATION_VERSION="1.0.0"

if ! leenium-hw-match "XPS" || ! leenium-hw-intel-ptl || [[ ! -f /etc/default/limine ]]; then
  exit 0
fi

if grep -Fq 'xe.enable_psr=0' /etc/default/limine; then
  exit 0
fi

echo 'KERNEL_CMDLINE[default]+=" xe.enable_psr=0"' | sudo tee -a /etc/default/limine >/dev/null
sudo limine-mkinitcpio
