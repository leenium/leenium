# Copy over Leenium configs
mkdir -p ~/.config
cp -R ~/.local/share/leenium/config/* ~/.config/

# Use default interactive shell configs from Leenium
cp ~/.local/share/leenium/default/bashrc ~/.bashrc
cp ~/.local/share/leenium/default/zshrc ~/.zshrc
cp ~/.local/share/leenium/default/zprofile ~/.zprofile
