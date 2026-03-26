local M = {}

M.base_30 = {
  white = "#f6dcac",
  darker_black = "#00111f",
  black = "#05182e",
  black2 = "#0a2037",
  one_bg = "#102945",
  one_bg2 = "#134e5a",
  one_bg3 = "#1c6170",
  grey = "#3f8f8a",
  grey_fg = "#5d9f9b",
  grey_fg2 = "#8cbfb8",
  light_grey = "#a7c9c6",
  red = "#f85525",
  baby_pink = "#faa968",
  pink = "#e97b3c",
  line = "#134e5a",
  green = "#028391",
  vibrant_green = "#8cbfb8",
  nord_blue = "#3f8f8a",
  blue = "#faa968",
  yellow = "#e97b3c",
  sun = "#faa968",
  purple = "#8cbfb8",
  dark_purple = "#3f8f8a",
  teal = "#8cbfb8",
  orange = "#faa968",
  cyan = "#8cbfb8",
  statusline_bg = "#0a2037",
  lightbg = "#102945",
  pmenu_bg = "#faa968",
  folder_bg = "#faa968",
}

M.base_16 = {
  base00 = "#05182e",
  base01 = "#0a2037",
  base02 = "#102945",
  base03 = "#134e5a",
  base04 = "#3f8f8a",
  base05 = "#f6dcac",
  base06 = "#a7c9c6",
  base07 = "#fff2d3",
  base08 = "#f85525",
  base09 = "#e97b3c",
  base0A = "#faa968",
  base0B = "#028391",
  base0C = "#8cbfb8",
  base0D = "#3f8f8a",
  base0E = "#faa968",
  base0F = "#134e5a",
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.white },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.orange },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "retro_82")

return M
