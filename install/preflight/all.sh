source $LEENIUM_INSTALL/preflight/guard.sh
source $LEENIUM_INSTALL/preflight/begin.sh
run_logged $LEENIUM_INSTALL/preflight/show-env.sh
run_logged $LEENIUM_INSTALL/preflight/pacman.sh
run_logged $LEENIUM_INSTALL/preflight/migrations.sh
run_logged $LEENIUM_INSTALL/preflight/first-run-mode.sh
run_logged $LEENIUM_INSTALL/preflight/disable-mkinitcpio.sh
