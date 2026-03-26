return {
  plugin = {
    "tahayvr/matteblack.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("matteblack")
  end,
}
