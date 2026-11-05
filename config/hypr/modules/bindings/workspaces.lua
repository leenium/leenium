-- Workspaces 1-10, scratchpad, and moving workspaces between monitors.

local keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }

for index, key in ipairs(keys) do
  local workspace = index
  bind_dsp("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), "Switch to workspace " .. workspace)
  bind_dsp("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), "Move window to workspace " .. workspace)
  bind_dsp("SUPER + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace), follow = false }), "Move window silently to workspace " .. workspace)
end

bind_dsp("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }), "Next workspace")
bind_dsp("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), "Previous workspace")
bind_dsp("SUPER + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }), "Former workspace")

-- Scratchpad: a hidden workspace you can toggle over everything.
bind_dsp("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"), "Toggle scratchpad")
bind_dsp("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), "Move window to scratchpad")

-- Send the active workspace to another monitor.
bind_dsp("SUPER + SHIFT + ALT + LEFT",  hl.dsp.workspace.move({ monitor = "l" }), "Move workspace to left monitor")
bind_dsp("SUPER + SHIFT + ALT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }), "Move workspace to right monitor")
bind_dsp("SUPER + SHIFT + ALT + UP",    hl.dsp.workspace.move({ monitor = "u" }), "Move workspace to up monitor")
bind_dsp("SUPER + SHIFT + ALT + DOWN",  hl.dsp.workspace.move({ monitor = "d" }), "Move workspace to down monitor")
