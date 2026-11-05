-- Closing windows and quick visual toggles.

bind_dsp("SUPER + Q", hl.dsp.window.close(), "Close window")
bind_dsp("SUPER + W", hl.dsp.window.close(), "Close window")

bind_script("CTRL + ALT + DELETE", "leenium-window-close-all", nil, "Close all windows")

bind_script("SUPER + BACKSPACE",         "leenium-window-transparency-toggle", nil, "Toggle window transparency")
bind_script("SUPER + SHIFT + BACKSPACE", "leenium-window-gaps-toggle",         nil, "Toggle window gaps")
