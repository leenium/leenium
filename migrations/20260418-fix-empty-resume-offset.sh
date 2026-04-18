echo "Fix empty resume_offset in hibernation config"
MIGRATION_VERSION="1.0.0"

RESUME_DROP_IN="/etc/limine-entry-tool.d/resume.conf"
SWAP_FILE="/swap/swapfile"

if [[ ! -f $RESUME_DROP_IN ]] || ! grep -q 'resume_offset="$' "$RESUME_DROP_IN" || [[ ! -f $SWAP_FILE ]]; then
  exit 0
fi

RESUME_OFFSET=$(sudo btrfs inspect-internal map-swapfile -r "$SWAP_FILE" 2>/dev/null)

if [[ -z $RESUME_OFFSET ]]; then
  echo "Warning: Could not determine resume offset for $SWAP_FILE"
  exit 0
fi

sudo sed -i "s/resume_offset=\"$/resume_offset=$RESUME_OFFSET\"/" "$RESUME_DROP_IN"
sudo sed -i "s/resume_offset=\"$/resume_offset=$RESUME_OFFSET\"/" /etc/default/limine
sudo limine-mkinitcpio
sudo limine-update
echo "Fixed: resume_offset=$RESUME_OFFSET"
