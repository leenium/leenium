return {
  plugin = {
    "ribru17/bamboo.nvim",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("bamboo")
  end,
}
