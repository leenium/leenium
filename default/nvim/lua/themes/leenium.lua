local M = {}

M.base_30 = {
  white = "#d8f7ea",
  darker_black = "#04080b",
  black = "#060b0f",
  black2 = "#0b1319",
  one_bg = "#0f1920",
  one_bg2 = "#16242d",
  one_bg3 = "#1d313d",
  grey = "#284350",
  grey_fg = "#376781",
  grey_fg2 = "#5d8a7b",
  light_grey = "#8cb7a9",
  red = "#ff5f56",
  baby_pink = "#ff7a72",
  pink = "#94f1cd",
  line = "#1d313d",
  green = "#35d6a0",
  vibrant_green = "#5cf0ad",
  nord_blue = "#4a6d82",
  blue = "#4a6d82",
  yellow = "#ffd479",
  sun = "#ffe19a",
  purple = "#94f1cd",
  dark_purple = "#35d6a0",
  teal = "#94f1cd",
  orange = "#ffd479",
  cyan = "#b7f7de",
  statusline_bg = "#0b1319",
  lightbg = "#16242d",
  pmenu_bg = "#35d6a0",
  folder_bg = "#35d6a0",
}

M.base_16 = {
  base00 = "#060b0f",
  base01 = "#0b1319",
  base02 = "#16242d",
  base03 = "#1d313d",
  base04 = "#376781",
  base05 = "#d8f7ea",
  base06 = "#b7f7de",
  base07 = "#e7fff4",
  base08 = "#ff5f56",
  base09 = "#ffd479",
  base0A = "#ffe19a",
  base0B = "#35d6a0",
  base0C = "#94f1cd",
  base0D = "#4a6d82",
  base0E = "#5cf0ad",
  base0F = "#ff7a72",
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.white },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.yellow },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "leenium")

return M
