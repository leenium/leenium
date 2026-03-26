return {
  base46_theme = "catppuccin",
  plugin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
