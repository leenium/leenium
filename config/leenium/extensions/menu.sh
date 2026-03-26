# Overwrite parts of the leenium-menu with user-specific submenus.
# See $LEENIUM_PATH/bin/leenium-menu for functions that can be overwritten.
#
# WARNING: Overwritten functions will obviously not be updated when Leenium changes.
#
# Example of minimal system menu:
#
# show_system_menu() {
#   case $(menu "System" "  Lock\n󰐥  Shutdown") in
#   *Lock*) leenium-lock-screen ;;
#   *Shutdown*) leenium-system-shutdown ;;
#   *) back_to show_main_menu ;;
#   esac
# }
#
# Example of overriding just the about menu action: (Using zsh instead of bash (default))
#
# show_about() {
#   exec leenium-launch-or-focus-tui "zsh -c 'fastfetch; read -k 1'"
# }
