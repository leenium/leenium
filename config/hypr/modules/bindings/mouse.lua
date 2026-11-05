-- Mouse: hold SUPER and drag with the left/right mouse button.

bind_dsp("SUPER + mouse:272", hl.dsp.window.drag(),   "Move window with mouse",   { mouse = true })
bind_dsp("SUPER + mouse:273", hl.dsp.window.resize(), "Resize window with mouse", { mouse = true })

-- Scroll to change workspace.
bind_dsp("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), "Scroll active workspace forward")
bind_dsp("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), "Scroll active workspace backward")
