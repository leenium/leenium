return {
  base46_theme = "kanagawa",
  plugin = {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("kanagawa")
  end,
}
