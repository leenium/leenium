echo "Install socat and start the Hyprland monitor watcher"
MIGRATION_VERSION="1.0.0"

leenium-pkg-add socat

if [[ -n $HYPRLAND_INSTANCE_SIGNATURE ]] && ! pgrep -f "leenium-hyprland-monitor-watch" >/dev/null; then
  uwsm-app -- leenium-hyprland-monitor-watch >/dev/null 2>&1 &
fi
