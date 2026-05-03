echo "Raise soft file descriptor limit so dev tools have headroom (takes effect after reboot)"
MIGRATION_VERSION="1.2.0"

bash "$LEENIUM_PATH/install/config/increase-fd-limit.sh"
