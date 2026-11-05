-- Universal clipboard shortcuts.
--
-- Send the shortcut directly to the focused surface instead of using wtype:
-- the physically held SUPER would otherwise merge into the injected chord.
-- The down/up split works around Hyprland sometimes leaving synthetic key
-- state stuck or repeating.
local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

local terminal_classes = {
  ["ghostty"] = true,
  ["com.mitchellh.ghostty"] = true,
  ["kitty"] = true,
  ["Alacritty"] = true,
  ["foot"] = true,
  ["org.wezfurlong.wezterm"] = true,
}

local function active_window_is_terminal()
  local window = hl.get_active_window()
  return window ~= nil and terminal_classes[window.class or ""] == true
end

local function universal_clipboard_shortcut(default_mods, default_key, terminal_mods, terminal_key)
  return function()
    if active_window_is_terminal() then
      send_shortcut_once(terminal_mods, terminal_key)()
    else
      send_shortcut_once(default_mods, default_key)()
    end
  end
end

bind_fn("SUPER + C", universal_clipboard_shortcut("CTRL", "C", "CTRL", "Insert"), "Universal copy")
bind_fn("SUPER + V", universal_clipboard_shortcut("CTRL", "V", "SHIFT", "Insert"), "Universal paste")
bind_fn("SUPER + X", send_shortcut_once("CTRL", "X"), "Universal cut")

-- cliphist-backed clipboard history in fuzzel.
bind_script("SUPER + CTRL + V", "leenium-clipboard", nil, "Clipboard manager")
