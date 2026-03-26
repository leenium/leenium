return {
  base46_theme = "nord",
  plugin = {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("nordfox")
  end,
}
