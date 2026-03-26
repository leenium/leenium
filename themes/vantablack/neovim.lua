return {
  plugin = {
    "bjarneo/vantablack.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("vantablack")
  end,
}
