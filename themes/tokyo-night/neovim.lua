return {
  base46_theme = "tokyonight",
  plugin = {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
