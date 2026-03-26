return {
  plugin = {
    "omacom-io/lumon.nvim",
    name = "lumon",
    dependencies = { "bjarneo/aether.nvim" },
    priority = 1000,
  },
  apply = function()
    vim.cmd.colorscheme("lumon")
  end,
}
