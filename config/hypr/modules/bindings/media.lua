-- Volume, brightness, keyboard backlight, and media keys.

local locked = { locked = true }
local repeat_locked = { repeating = true, locked = true }

-- Media keys repeat while held and must keep working on the lock screen.
-- The actual work lives in the leenium-* helper scripts, so the bindings stay
-- declarative and the shell logic lives in exactly one place.
local function media(keys, helper, args, description)
  bind_script(keys, helper, args, description, repeat_locked)
end

-- Volume.
media("XF86AudioRaiseVolume", "leenium-volume", "up",   "Volume up")
media("XF86AudioLowerVolume", "leenium-volume", "down", "Volume down")
media("XF86AudioMute",        "leenium-volume", "mute", "Mute")
media("XF86AudioMicMute",     "leenium-volume", "mic",  "Microphone mute")
bind_script("SHIFT + XF86AudioMute", "leenium-volume", "output", "Switch audio output", locked)

-- Precise volume (1% steps).
media("ALT + XF86AudioRaiseVolume", "leenium-volume", "up-precise",   "Volume up (1%)")
media("ALT + XF86AudioLowerVolume", "leenium-volume", "down-precise", "Volume down (1%)")

-- Display brightness.
media("XF86MonBrightnessUp",   "leenium-brightness", "up",   "Brightness up")
media("XF86MonBrightnessDown", "leenium-brightness", "down", "Brightness down")
bind_script("SHIFT + XF86MonBrightnessUp",   "leenium-brightness", "max", "Maximum brightness", locked)
bind_script("SHIFT + XF86MonBrightnessDown", "leenium-brightness", "min", "Minimum brightness", locked)
media("ALT + XF86MonBrightnessUp",   "leenium-brightness", "up-precise",   "Brightness up (1%)")
media("ALT + XF86MonBrightnessDown", "leenium-brightness", "down-precise", "Brightness down (1%)")

-- Keyboard backlight (devices without one simply ignore the command).
media("XF86KbdBrightnessUp",   "leenium-keyboard-backlight", "up",   "Keyboard brightness up")
media("XF86KbdBrightnessDown", "leenium-keyboard-backlight", "down", "Keyboard brightness down")
bind_script("XF86KbdLightOnOff", "leenium-keyboard-backlight", "cycle", "Cycle keyboard backlight", locked)

-- Media transport and source switching.
bind_script("XF86AudioNext",  "leenium-media", "next",       "Next track", locked)
bind_script("XF86AudioPrev",  "leenium-media", "previous",   "Previous track", locked)
bind_script("XF86AudioPlay",  "leenium-media", "play-pause", "Play", locked)
bind_script("XF86AudioPause", "leenium-media", "play-pause", "Pause", locked)
bind_script("ALT + XF86AudioPlay",         "leenium-media", "next",     "Next track", locked)
bind_script("ALT + SHIFT + XF86AudioPlay", "leenium-media", "previous", "Previous track", locked)
bind_script("SHIFT + XF86AudioPlay",  "leenium-media", "cycle", "Switch media source", locked)
bind_script("SHIFT + XF86AudioPause", "leenium-media", "cycle", "Switch media source", locked)
bind_exec("XF86Eject", "eject", "Eject media", locked)

-- Touchpad.
bind_script("XF86TouchpadToggle", "leenium-touchpad", "toggle", "Toggle touchpad", locked)
bind_script("XF86TouchpadOn",     "leenium-touchpad", "on",     "Enable touchpad", locked)
bind_script("XF86TouchpadOff",    "leenium-touchpad", "off",    "Disable touchpad", locked)
