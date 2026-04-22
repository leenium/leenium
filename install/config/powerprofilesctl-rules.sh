if leenium-battery-present; then
  cat <<EOF | sudo tee "/etc/udev/rules.d/99-power-profile.rules"
SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", RUN+="/usr/bin/systemd-run --no-block --collect --unit=leenium-power-profile-battery --property=After=power-profiles-daemon.service $HOME/.local/share/leenium/bin/leenium-powerprofiles-set battery"
SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", RUN+="/usr/bin/systemd-run --no-block --collect --unit=leenium-power-profile-ac --property=After=power-profiles-daemon.service $HOME/.local/share/leenium/bin/leenium-powerprofiles-set ac"
EOF

  sudo udevadm control --reload 2>/dev/null
  sudo udevadm trigger --subsystem-match=power_supply 2>/dev/null
fi