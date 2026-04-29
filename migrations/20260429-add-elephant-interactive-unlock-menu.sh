echo "Use interactive unlock (Plymouth) selector menu"
MIGRATION_VERSION="1.1.2"

mkdir -p ~/.config/elephant/menus
ln -snf $LEENIUM_PATH/default/elephant/leenium_unlocks.lua ~/.config/elephant/menus/leenium_unlocks.lua
leenium-restart-walker
