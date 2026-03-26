#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Leenium locations
export LEENIUM_PATH="$HOME/.local/share/leenium"
export LEENIUM_INSTALL="$LEENIUM_PATH/install"
export LEENIUM_INSTALL_LOG_FILE="/var/log/leenium-install.log"
export PATH="$LEENIUM_PATH/bin:$PATH"

# Install
source "$LEENIUM_INSTALL/helpers/all.sh"
source "$LEENIUM_INSTALL/preflight/all.sh"
source "$LEENIUM_INSTALL/packaging/all.sh"
source "$LEENIUM_INSTALL/config/all.sh"
source "$LEENIUM_INSTALL/login/all.sh"
source "$LEENIUM_INSTALL/post-install/all.sh"
