-- Focus movement and window cycling.

bind_dsp("SUPER + LEFT",  hl.dsp.focus({ direction = "l" }), "Focus on left window")
bind_dsp("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }), "Focus on right window")
bind_dsp("SUPER + UP",    hl.dsp.focus({ direction = "u" }), "Focus on above window")
bind_dsp("SUPER + DOWN",  hl.dsp.focus({ direction = "d" }), "Focus on below window")

-- Alt+Tab cycles windows and raises the new active window.
local function cycle_and_raise(dispatcher)
  return function()
    hl.dispatch(dispatcher)
    hl.dispatch(hl.dsp.window.bring_to_top())
  end
end

bind_fn("ALT + TAB",         cycle_and_raise(hl.dsp.window.cycle_next()),                   "Next window")
bind_fn("ALT + SHIFT + TAB", cycle_and_raise(hl.dsp.window.cycle_next({ next = false })),  "Previous window")

-- Monitor focus.
bind_dsp("CTRL + ALT + TAB", hl.dsp.focus({ monitor = "+1" }), "Focus on next monitor")
bind_dsp("CTRL + ALT + SHIFT + TAB", hl.dsp.focus({ monitor = "-1" }), "Focus on previous monitor")
