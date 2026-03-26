# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run leenium-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.local/share/leenium/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$LEENIUM_USER_NAME"
<Multi_key> <space> <e> : "$LEENIUM_USER_EMAIL"
EOF
