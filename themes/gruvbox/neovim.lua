return {
  base46_theme = "gruvbox",
  plugin = {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("gruvbox")
  end,
}
