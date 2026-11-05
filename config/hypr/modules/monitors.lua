-- Any output: preferred mode, automatic position and scale.

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local desktop_monitor_scale = 1.6

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = desktop_monitor_scale })

-- Configure a specific monitor.

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
