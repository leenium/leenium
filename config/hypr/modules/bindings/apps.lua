-- Core applications.

bind_exec("SUPER + RETURN",       "ghostty",                                "Terminal")
bind_exec("SUPER + ALT + RETURN", "ghostty -e tmux new-session -A -s main", "Tmux session")

-- Both browser keys use the user's default browser, not a hard-coded Firefox.
bind_script("SUPER + SHIFT + RETURN",  "leenium-launch-browser", nil,         "Web browser")
bind_script("SUPER + SHIFT + B",       "leenium-launch-browser", nil,         "Web browser")
bind_script("SUPER + SHIFT + ALT + B", "leenium-launch-browser", "--private", "Web browser (private)")

bind_exec("SUPER + E", "nautilus --new-window", "File manager")
bind_script("SUPER + ALT + SHIFT + F", "leenium-file-manager-cwd", nil, "File manager (cwd)")

-- SUPER + N is the convenient editor key; SUPER + SHIFT + N keeps the
bind_exec("SUPER + N",         "ghostty -e nvim", "Editor (Neovim)")
bind_exec("SUPER + SHIFT + N", "ghostty -e nvim", "Editor (Neovim)")

bind_exec("SUPER + M",         "ghostty --class=leenium.music -e cliamp", "Music (Cliamp)")
bind_exec("SUPER + SHIFT + T", "ghostty --class=leenium.tui -e btop",     "System monitor")

-- Add personal binds in ~/.config/hypr/user.lua.
