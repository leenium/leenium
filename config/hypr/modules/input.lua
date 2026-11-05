-- Keep only your personal input overrides here. Uncommented settings below
-- replace Leenium's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
    kb_layout = "us,ir",
    kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",

    -- -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
    -- kb_variant = "intl",
    --
    -- -- Change speed of keyboard repeat.
    repeat_rate = 40,
    repeat_delay = 250,
    --
    -- -- Start with numlock on by default.
    numlock_by_default = true,

    -- -- Increase sensitivity for mouse/trackpad (default: 0).
    -- sensitivity = -2.9,
    --
    -- -- Turn off mouse acceleration (default: adaptive).
    -- accel_profile = "flat",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      -- Use natural (inverse) scrolling.
      natural_scroll = true,

      -- Use two-finger clicks for right-click instead of lower-right corner.
      clickfinger_behavior = true,

      -- Control the speed of your scrolling.
      -- scroll_factor = 0.4,

      -- Enable the touchpad while typing.
      disable_while_typing = true,

      -- Left-click-and-drag with three fingers.
      drag_3fg = 1,
    },
  },
})
