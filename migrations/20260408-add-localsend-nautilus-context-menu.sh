echo "Add LocalSend entry to Nautilus context menu"
MIGRATION_VERSION="1.0.0"

nautilus_python_script="$LEENIUM_PATH/install/config/nautilus-python.sh"

if [[ -f $nautilus_python_script ]]; then
  source "$nautilus_python_script"
fi
