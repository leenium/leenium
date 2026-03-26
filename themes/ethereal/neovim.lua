return {
  plugin = {
    "bjarneo/ethereal.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("ethereal")
  end,
}
