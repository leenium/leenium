#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export LEENIUM_ONLINE_INSTALL=true

ansi_art='                                                                ▄▄▄
 ▄█        ▄██████▄  ▄██████▄  ▄█    █▄    ▄█   ▄█   █▄    ▄███████████▄ 
███       ███       ███       ████   ███  ███  ███   ███  ███   ███   ███
███       ███       ███       █████  ███  ███  ███   ███  ███   ███   ███
███      ▄███▄▄▄▄  ▄███▄▄▄▄   ██████ ███  ███  ███   ███  ███   ███   ███
███      ▀███▀▀▀▀  ▀███▀▀▀▀   ███ ██████  ███  ███   ███  ███   ███   ███
███       ███       ███       ███  █████  ███  ███   ███  ███   ███   ███
███       ███       ███       ███   ████  ███  ███   ███  ███   ███   ███
 ▀██████▀  ▀██████▀  ▀██████▀  ▀█    █▀   █▀    ▀█████▀    ▀█   ███   █▀'


clear
echo -e "\n$ansi_art\n"

# Use custom branch if instructed, otherwise default to master
LEENIUM_REF="${LEENIUM_REF:-master}"

cat <<'EOF' | sudo tee /etc/pacman.d/mirrorlist >/dev/null
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
EOF

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to the canonical installer repo URL.
LEENIUM_REPO="${LEENIUM_REPO:-https://github.com/leenium/leenium.git}"
LEENIUM_REPO_URL="$LEENIUM_REPO"
if [[ $LEENIUM_REPO_URL != http://* && $LEENIUM_REPO_URL != https://* && $LEENIUM_REPO_URL != git@* ]]; then
  LEENIUM_REPO_URL="https://github.com/${LEENIUM_REPO_URL}.git"
fi

echo -e "\nCloning Leenium from: ${LEENIUM_REPO_URL}"
rm -rf ~/.local/share/leenium/
git clone "$LEENIUM_REPO_URL" ~/.local/share/leenium >/dev/null

echo -e "\e[32mUsing branch: $LEENIUM_REF\e[0m"
cd ~/.local/share/leenium
git fetch origin "${LEENIUM_REF}" && git checkout "${LEENIUM_REF}"
cd -

echo -e "\nInstallation starting..."
source ~/.local/share/leenium/install.sh
