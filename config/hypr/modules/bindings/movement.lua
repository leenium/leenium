-- Move (swap) windows and resize them.

bind_dsp("SUPER + SHIFT + LEFT",  hl.dsp.window.swap({ direction = "l" }), "Swap window to the left")
bind_dsp("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }), "Swap window to the right")
bind_dsp("SUPER + SHIFT + UP",    hl.dsp.window.swap({ direction = "u" }), "Swap window up")
bind_dsp("SUPER + SHIFT + DOWN",  hl.dsp.window.swap({ direction = "d" }), "Swap window down")

-- Resize the active window. MINUS grows the left edge, EQUAL shrinks it.
-- SHIFT resizes vertically; ALT/CTRL change the step size.
local resize = function(x, y)
  return function()
    hl.dispatch(hl.dsp.window.resize({ x = x, y = y, relative = true }))
  end
end

bind_fn("SUPER + MINUS", resize(-100, 0), "Expand window left", { repeating = true })
bind_fn("SUPER + EQUAL", resize(100, 0), "Shrink window left", { repeating = true })
bind_fn("SUPER + SHIFT + MINUS", resize(0, -100), "Shrink window up", { repeating = true })
bind_fn("SUPER + SHIFT + EQUAL", resize(0, 100), "Expand window down", { repeating = true })

bind_fn("SUPER + ALT + MINUS", resize(-25, 0), "Expand window left a little", { repeating = true })
bind_fn("SUPER + ALT + EQUAL", resize(25, 0), "Shrink window left a little", { repeating = true })
bind_fn("SUPER + SHIFT + ALT + MINUS", resize(0, -25), "Shrink window up a little", { repeating = true })
bind_fn("SUPER + SHIFT + ALT + EQUAL", resize(0, 25), "Expand window down a little", { repeating = true })

bind_fn("SUPER + CTRL + MINUS", resize(-300, 0), "Expand window left a lot", { repeating = true })
bind_fn("SUPER + CTRL + EQUAL", resize(300, 0), "Shrink window left a lot", { repeating = true })
bind_fn("SUPER + SHIFT + CTRL + MINUS", resize(0, -300), "Shrink window up a lot", { repeating = true })
bind_fn("SUPER + SHIFT + CTRL + EQUAL", resize(0, 300), "Expand window down a lot", { repeating = true })
