return {
  base46_theme = "retro_82",
  plugin = {
    "OldJobobo/retro-82.nvim",
    name = "retro-82",
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("retro-82")
  end,
}
