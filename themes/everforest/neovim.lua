return {
  base46_theme = "everforest",
  plugin = {
    "neanias/everforest-nvim",
    priority = 1000,
  },
  apply = function()
    vim.g.everforest_background = "soft"
    vim.cmd.colorscheme("everforest")
  end,
}
