echo "Set power profile based on source switching (AC or Battery)"
MIGRATION_VERSION="1.0.0"

powerprofilesctl_rules="$LEENIUM_PATH/install/config/first-run/powerprofilesctl-rules.sh"

if [[ -f $powerprofilesctl_rules ]]; then
  source "$powerprofilesctl_rules"
fi
