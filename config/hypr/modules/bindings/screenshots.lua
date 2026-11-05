-- Screenshots, screen recording, OCR, and the color picker.

bind_script("SUPER + SHIFT + S",     "leenium-screenshot", "region",   "Screenshot region → clipboard")
bind_script("PRINT",                 "leenium-screenshot", "screen",   "Screenshot screen → clipboard")
bind_script("SUPER + PRINT",         "leenium-screenshot", "file",     "Screenshot screen → file")
bind_script("SUPER + SHIFT + PRINT", "leenium-screenshot", "annotate", "Screenshot region → annotate")
bind_exec("SUPER + SHIFT + C", "hyprpicker -a", "Color picker → clipboard")

bind_script("ALT + PRINT",            "leenium-screenrecord", nil, "Screen recording (toggle)")
bind_script("SUPER + CTRL + PRINT",   "leenium-ocr",          nil, "Extract text (OCR) from screen region")
bind_script("SUPER + CTRL + C",       "leenium-capture-menu", nil, "Capture menu")
