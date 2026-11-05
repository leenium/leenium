-- Window groups (tabs).

bind_dsp("SUPER + G", hl.dsp.group.toggle(), "Toggle window grouping")
bind_dsp("SUPER + ALT + G", hl.dsp.window.move({ out_of_group = true }), "Move active window out of group")

bind_dsp("SUPER + ALT + LEFT",  hl.dsp.window.move({ into_group = "l" }), "Move window to group on left")
bind_dsp("SUPER + ALT + RIGHT", hl.dsp.window.move({ into_group = "r" }), "Move window to group on right")
bind_dsp("SUPER + ALT + UP",    hl.dsp.window.move({ into_group = "u" }), "Move window to group on top")
bind_dsp("SUPER + ALT + DOWN",  hl.dsp.window.move({ into_group = "d" }), "Move window to group on bottom")

bind_dsp("SUPER + ALT + TAB", hl.dsp.group.next(), "Next window in group")
bind_dsp("SUPER + ALT + SHIFT + TAB", hl.dsp.group.prev(), "Previous window in group")

bind_dsp("SUPER + CTRL + LEFT",  hl.dsp.group.prev(), "Move grouped window focus left")
bind_dsp("SUPER + CTRL + RIGHT", hl.dsp.group.next(), "Move grouped window focus right")

bind_dsp("SUPER + ALT + mouse_down", hl.dsp.group.next(), "Next window in group")
bind_dsp("SUPER + ALT + mouse_up",   hl.dsp.group.prev(), "Previous window in group")

for index = 1, 5 do
  bind_dsp("SUPER + ALT + " .. index, hl.dsp.group.active({ index = index }), "Switch to group window " .. index)
end
