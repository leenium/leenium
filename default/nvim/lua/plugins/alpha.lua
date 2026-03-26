return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
      local alpha = require "alpha"
      local dashboard = require "alpha.themes.dashboard"

      dashboard.section.header.val = {
        "                                                                ▄▄▄",
        " ▄█        ▄██████▄  ▄██████▄  ▄█    █▄    ▄█   ▄█   █▄    ▄███████████▄ ",
        "███       ███       ███       ████   ███  ███  ███   ███  ███   ███   ███",
        "███       ███       ███       █████  ███  ███  ███   ███  ███   ███   ███",
        "███      ▄███▄▄▄▄  ▄███▄▄▄▄   ██████ ███  ███  ███   ███  ███   ███   ███",
        "███      ▀███▀▀▀▀  ▀███▀▀▀▀   ███ ██████  ███  ███   ███  ███   ███   ███",
        "███       ███       ███       ███  █████  ███  ███   ███  ███   ███   ███",
        "███       ███       ███       ███   ████  ███  ███   ███  ███   ███   ███",
        " ▀██████▀  ▀██████▀  ▀██████▀  ▀█    █▀   █▀    ▀█████▀    ▀█   ███   █▀ ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find Files", "<cmd>Telescope find_files<CR>"),
        dashboard.button("g", "󰱼  Live Grep", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("r", "  Recent Files", "<cmd>lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>"),
        dashboard.button("e", "  File Explorer", "<cmd>NvimTreeFocus<CR>"),
        dashboard.button("c", "  Neovim Config", "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>"),
        dashboard.button("t", "  Theme Picker", "<cmd>lua require('nvchad.themes').open()<CR>"),
        dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
        dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
        dashboard.button("h", "󰋖  Cheatsheet", "<cmd>NvCheatsheet<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Keyword"
        button.opts.hl_shortcut = "Title"
        button.opts.width = 46
        button.opts.cursor = 3
        button.opts.align_shortcut = "right"
      end

      dashboard.section.header.opts.hl = "Type"
      dashboard.section.buttons.opts.spacing = 1

      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        local today = os.date "%d %b %Y"

        return {
          "",
          "Telescope first. Friction later.",
          string.format("Loaded %d/%d plugins in %.2f ms  •  %s", stats.loaded, stats.count, stats.startuptime, today),
        }
      end

      dashboard.section.footer.opts.hl = "Comment"

      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          pcall(alpha.redraw)
        end,
      })
    end,
  },
}
