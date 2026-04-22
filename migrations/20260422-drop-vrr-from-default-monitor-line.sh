echo "Drop vrr,1 from default monitor line as it creates a small lag"
MIGRATION_VERSION="1.0.0"

MONITORS_CONF=~/.config/hypr/monitors.conf

if [[ -f $MONITORS_CONF ]] && grep -q '^monitor=,preferred,auto,auto,vrr,1$' "$MONITORS_CONF"; then
  sed -i 's/^monitor=,preferred,auto,auto,vrr,1$/monitor=,preferred,auto,auto/' "$MONITORS_CONF"

  if [[ -n $HYPRLAND_INSTANCE_SIGNATURE ]]; then
    hyprctl reload >/dev/null 2>&1 || true
  fi
fi
