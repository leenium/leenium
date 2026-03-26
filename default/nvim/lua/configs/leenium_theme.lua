local M = {}

local uv = vim.uv

local function expand(path)
  return vim.fn.expand(path)
end

local function read_file(path)
  local fd = uv.fs_open(path, "r", 420)

  if not fd then
    return nil
  end

  local stat = uv.fs_fstat(fd)

  if not stat then
    uv.fs_close(fd)
    return nil
  end

  local data = uv.fs_read(fd, stat.size, 0)
  uv.fs_close(fd)

  return data
end

local function trim(value)
  return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function load_theme_module(path)
  local chunk, err = loadfile(path)

  if not chunk then
    return nil, err
  end

  local ok, theme = pcall(chunk)

  if not ok then
    return nil, theme
  end

  if type(theme) ~= "table" then
    return nil, "theme module must return a table"
  end

  return theme
end

local function current_theme_name()
  local data = read_file(expand("~/.config/leenium/current/theme.name"))

  if not data then
    return nil
  end

  local theme_name = trim(data)

  if theme_name == "" then
    return nil
  end

  return theme_name
end

local function theme_module_path(theme_name)
  local paths = {
    expand("~/.config/leenium/current/theme/neovim.lua"),
    expand("~/.config/leenium/themes/" .. theme_name .. "/neovim.lua"),
    expand("~/.local/share/leenium/themes/" .. theme_name .. "/neovim.lua"),
  }

  for _, path in ipairs(paths) do
    if uv.fs_stat(path) then
      return path
    end
  end

  return nil
end

local function theme_signature()
  local theme_name = current_theme_name() or ""
  local theme_path = theme_name ~= "" and theme_module_path(theme_name) or nil
  local stat = theme_path and uv.fs_stat(theme_path) or nil
  local mtime = stat and stat.mtime and (stat.mtime.sec .. ":" .. stat.mtime.nsec) or "missing"

  return theme_name .. "|" .. mtime
end

local function theme_plugin_name(theme)
  local plugin = theme.plugin

  if type(plugin) ~= "table" then
    return nil
  end

  if plugin.name then
    return plugin.name
  end

  if type(plugin[1]) == "string" then
    return plugin[1]:match(".+/([^/]+)$") or plugin[1]
  end

  return nil
end

local function ensure_theme_loaded(theme)
  local plugin_name = theme_plugin_name(theme)

  if plugin_name then
    pcall(require("lazy").load, { plugins = { plugin_name } })
  end
end

local function sync_base46_theme(theme)
  if type(theme.base46_theme) ~= "string" or theme.base46_theme == "" then
    return
  end

  local ok_config, nvconfig = pcall(require, "nvconfig")

  if ok_config and nvconfig.base46 then
    nvconfig.base46.theme = theme.base46_theme
  end

  pcall(function()
    require("base46").load_all_highlights()
  end)
end

local function fallback_theme()
  pcall(vim.cmd.colorscheme, "nvchad")
end

local function ensure_ibl_highlights()
  local whitespace = vim.api.nvim_get_hl(0, { name = "Whitespace", link = false })
  local line_nr = vim.api.nvim_get_hl(0, { name = "LineNr", link = false })

  if whitespace and next(whitespace) ~= nil then
    vim.api.nvim_set_hl(0, "IblChar", whitespace)
  else
    vim.api.nvim_set_hl(0, "IblChar", { fg = "#3b4261", nocombine = true })
  end

  if line_nr and next(line_nr) ~= nil then
    vim.api.nvim_set_hl(0, "IblScopeChar", line_nr)
  else
    vim.api.nvim_set_hl(0, "IblScopeChar", { fg = "#5c7c99", nocombine = true })
  end
end

function M.apply_current_theme()
  local theme_name = current_theme_name()

  if not theme_name then
    fallback_theme()
    return
  end

  local path = theme_module_path(theme_name)

  if not path then
    fallback_theme()
    return
  end

  local theme, err = load_theme_module(path)

  if not theme then
    vim.schedule(function()
      vim.notify("Failed to load Neovim theme '" .. theme_name .. "': " .. err, vim.log.levels.WARN)
    end)
    fallback_theme()
    return
  end

  ensure_theme_loaded(theme)
  sync_base46_theme(theme)
  ensure_ibl_highlights()

  if type(theme.apply) == "function" then
    local ok, apply_err = pcall(theme.apply)

    if not ok then
      vim.schedule(function()
        vim.notify("Failed to apply Neovim theme '" .. theme_name .. "': " .. apply_err, vim.log.levels.WARN)
      end)
      fallback_theme()
      return
    end
  else
    fallback_theme()
    return
  end

  M.last_signature = theme_signature()
end

function M.plugin_specs()
  local specs = {}
  local seen = {}
  local roots = {
    expand("~/.local/share/leenium/themes"),
    expand("~/.config/leenium/themes"),
  }

  for _, root in ipairs(roots) do
    local paths = vim.fn.glob(root .. "/*/neovim.lua", false, true)

    for _, path in ipairs(paths) do
      local theme = load_theme_module(path)

      if theme and type(theme.plugin) == "table" then
        local key = theme.plugin.name or theme.plugin[1] or theme.plugin.dir or path

        if not seen[key] then
          seen[key] = true
          table.insert(specs, theme.plugin)
        end
      end
    end
  end

  return specs
end

function M.setup()
  local group = vim.api.nvim_create_augroup("LeeniumThemeRuntime", { clear = true })

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    pattern = "*",
    callback = ensure_ibl_highlights,
  })

  ensure_ibl_highlights()
  M.apply_current_theme()

  if M.timer then
    return
  end

  M.timer = uv.new_timer()
  M.last_signature = theme_signature()

  M.timer:start(0, 500, vim.schedule_wrap(function()
    local signature = theme_signature()

    if signature ~= M.last_signature then
      M.apply_current_theme()
    end
  end))
end

return M
