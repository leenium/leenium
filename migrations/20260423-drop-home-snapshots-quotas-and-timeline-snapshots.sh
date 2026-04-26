echo "Drop /home snapshots, btrfs quotas, and timeline snapshots (keep 5 root snapshots)"
MIGRATION_VERSION="1.1.1"

if ! leenium-cmd-present snapper btrfs; then
  exit 0
fi

# Disable quotas first so the cleanup below does not pay the qgroup accounting cost.
sudo btrfs quota disable / 2>/dev/null || true

if sudo snapper list-configs 2>/dev/null | grep -q "home"; then
  drop_home="yes"

  if sudo snapper -c home --csvout list 2>/dev/null | awk -F, '
    NR > 1 && (
      $6 == "pre" ||
      $6 == "post" ||
      $13 != "" ||
      ($12 != "current" && $12 != "timeline" && $12 !~ /^[0-9]+\.[0-9]+\.[0-9]+$/)
    )
  ' | grep -q .; then
    if leenium-cmd-present gum; then
      gum confirm "Drop /home snapshots for better performance?" || drop_home="no"
    else
      echo "Skipping /home snapshot removal because existing snapshots look user-managed"
      drop_home="no"
    fi
  fi

  if [[ $drop_home == "yes" ]]; then
    mapfile -t home_snapshot_ids < <(
      sudo snapper -c home --csvout --separator $'\t' --no-headers list --columns number 2>/dev/null |
        awk -F'\t' '$1 != "0" {print $1}'
    )

    if (( ${#home_snapshot_ids[@]} > 0 )); then
      sudo snapper -c home delete "${home_snapshot_ids[@]}" 2>/dev/null || true
    fi

    sudo snapper -c home delete-config 2>/dev/null || true

    if [[ -d /home/.snapshots ]]; then
      while IFS= read -r home_snapshot_subvol; do
        sudo btrfs subvolume delete "$home_snapshot_subvol" 2>/dev/null || true
      done < <(find /home/.snapshots -mindepth 2 -maxdepth 2 -type d -name snapshot 2>/dev/null | sort)

      sudo find /home/.snapshots -mindepth 1 -delete 2>/dev/null || true
      sudo btrfs subvolume delete /home/.snapshots 2>/dev/null || true
    fi
  fi
fi

if ! sudo snapper list-configs 2>/dev/null | grep -q "root"; then
  sudo snapper -c root create-config /
fi

sudo cp "$LEENIUM_PATH/default/snapper/root" /etc/snapper/configs/root

mapfile -t timeline_snapshot_ids < <(
  sudo snapper -c root --csvout --separator $'\t' --no-headers list --columns number,cleanup 2>/dev/null |
    awk -F'\t' '$2 == "timeline" {print $1}'
)

if (( ${#timeline_snapshot_ids[@]} > 0 )); then
  sudo snapper -c root delete "${timeline_snapshot_ids[@]}" 2>/dev/null || true
fi

sudo snapper -c root cleanup number 2>/dev/null || true
