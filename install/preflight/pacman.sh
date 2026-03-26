if [[ -n ${LEENIUM_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  leenium-pkg-add base-devel

  # Configure pacman
  sudo cp -f ~/.local/share/leenium/default/pacman/pacman-stable.conf /etc/pacman.conf
  sudo cp -f ~/.local/share/leenium/default/pacman/mirrorlist-stable /etc/pacman.d/mirrorlist

  sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
  sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

  sudo pacman -Sy
  leenium-pkg-add leenium-keyring

  # Refresh all repos
  sudo pacman -Syyuu --noconfirm
fi
