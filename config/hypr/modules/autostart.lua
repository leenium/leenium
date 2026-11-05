-- Start the small session services that the keybindings rely on.
hl.on("hyprland.start", function()
  hl.exec_cmd("mako")

  -- Clipboard history: text and images, capped at 100 entries.
  -- These two watchers are the only cliphist producers in the session.
  hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 100 store")
  hl.exec_cmd("wl-paste --type image --watch cliphist -max-items 100 store")

  hl.exec_cmd("hyprsunset")
end)
