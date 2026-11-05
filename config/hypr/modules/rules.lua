-- Small utility windows float and stay centered.
for _, class in ipairs({
  "^org\\.pulseaudio\\.pavucontrol$",
  "^pavucontrol$",
  "^nm-connection-editor$",
  "^org\\.gnome\\.Calculator$",
}) do
  hl.window_rule({ match = { class = class }, float = true, center = true })
end

-- Satty (screenshot annotation) is a modal overlay, not a tiled window.
hl.window_rule({
  match = { class = "com.gabm.satty" },
  float = true,
  center = true,
  no_anim = true,
})
