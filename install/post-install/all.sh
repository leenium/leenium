run_logged $LEENIUM_INSTALL/post-install/hibernation.sh
run_logged $LEENIUM_INSTALL/post-install/pacman.sh
run_logged $LEENIUM_INSTALL/post-install/sudo-rs.sh
source $LEENIUM_INSTALL/post-install/allow-reboot.sh
source $LEENIUM_INSTALL/post-install/finished.sh
