return {
  plugin = {
    "OldJobobo/miasma.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("miasma")
  end,
}
