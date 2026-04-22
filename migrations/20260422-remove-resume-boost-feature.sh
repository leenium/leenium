echo "Remove resume boost feature"
MIGRATION_VERSION="1.0.0"

if [[ -f /usr/lib/systemd/system-sleep/resume-boost ]]; then
  sudo rm /usr/lib/systemd/system-sleep/resume-boost
fi
