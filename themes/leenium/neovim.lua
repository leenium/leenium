return {
  base46_theme = "leenium",
  plugin = {
    "leenium/leenium.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("leenium")
  end,
}
