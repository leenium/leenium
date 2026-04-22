echo "Install missing Intel VPL drivers (libvpl, vpl-gpu-rt) on systems with Intel GPUs"
MIGRATION_VERSION="1.0.0"

bash "$LEENIUM_PATH/install/config/hardware/intel/video-acceleration.sh"
