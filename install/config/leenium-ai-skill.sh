# Place in ~/.claude/skills since all tools populate from there as well as their own sources
mkdir -p ~/.claude/skills
ln -s $LEENIUM_PATH/default/leenium-skill ~/.claude/skills/leenium
