echo "Enable FRED on Intel Panther Lake systems"
MIGRATION_VERSION="1.2.0"

DEFAULT_LIMINE="/etc/default/limine"

if leenium-hw-intel-ptl && [[ -f $DEFAULT_LIMINE ]] && ! grep -q 'fred=on' "$DEFAULT_LIMINE"; then
  source "$LEENIUM_PATH/install/config/hardware/intel/fred.sh"

  sudo limine-update
fi
