-- Window tiling: split, pseudo, float, fullscreen, layout.

bind_dsp("SUPER + J", hl.dsp.layout("togglesplit"), "Toggle window split")
bind_dsp("SUPER + P", hl.dsp.window.pseudo(), "Pseudo window")
bind_dsp("SUPER + T", hl.dsp.window.float({ action = "toggle" }), "Toggle window floating/tiling")

bind_dsp("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), "Full screen")
bind_script("SUPER + CTRL + F", "leenium-tiled-fullscreen", nil, "Tiled full screen")
bind_dsp("SUPER + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), "Full width")

-- Pop the active window out: float it, center it, and pin it above other windows.
bind_script("SUPER + O", "leenium-window-pop", nil, "Pop window out (float & pin)")

-- Cycle dwindle -> master -> scrolling.
bind_script("SUPER + L", "leenium-workspace-layout-toggle", nil, "Toggle workspace layout")

-- Save/restore the active window's exact width and height.
bind_script("SUPER + ALT + HOME", "leenium-window-width", "save",    "Save window width")
bind_script("SUPER + HOME",       "leenium-window-width", "restore", "Restore window width")

-- Monitor scale (SUPER+SLASH up, SUPER+ALT+SLASH down).
bind_script("SUPER + SLASH",       "leenium-monitor-scaling", "up",   "Monitor scaling up")
bind_script("SUPER + ALT + SLASH", "leenium-monitor-scaling", "down", "Monitor scaling down")
