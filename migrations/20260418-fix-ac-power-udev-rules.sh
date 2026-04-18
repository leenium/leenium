echo "Fix AC power udev rules to use systemd-run"
MIGRATION_VERSION="1.0.0"

powerprofilesctl_rules="$LEENIUM_PATH/install/config/powerprofilesctl-rules.sh"
wifi_powersave_rules="$LEENIUM_PATH/install/config/wifi-powersave-rules.sh"

if [[ -f $powerprofilesctl_rules ]]; then
  source "$powerprofilesctl_rules"
fi

if [[ -f $wifi_powersave_rules ]]; then
  source "$wifi_powersave_rules"
fi
