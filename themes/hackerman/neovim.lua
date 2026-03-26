return {
  plugin = {
    "bjarneo/hackerman.nvim",
    dependencies = { "bjarneo/aether.nvim" },
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("hackerman")
  end,
}
