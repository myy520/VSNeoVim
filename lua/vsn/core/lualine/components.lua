ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

ins_left {
  "branch",
  icon = "",
  color = { fg = colors.fg, gui = "bold" },
}

ins_left {
  "filename",
  fmt = function(str)
    return " " .. string.sub(str, 1)
  end,
  color = { fg = colors.fg },
}

ins_left {
  "diagnostics",
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.blue },
    hint = { fg = colors.green },
  },
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  update_in_insert = true,
  always_visible = false,
}

ins_left {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
  color = {
    fg = colors.fg,
  },
}

ins_left {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
      if venv then
        return string.format("  (%s)", conditions.env_cleanup(venv))
      end
      venv = os.getenv "VIRTUAL_ENV"
      if venv then
        return string.format("  (%s)", conditions.env_cleanup(venv))
      end
      return ""
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

ins_right {
  "diff",
  symbols = { added = "  ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
}

ins_right {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return " "
    else
      return "TS Off"
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    local msg = " No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return "﫟" .. client.name
      end
    end
    return msg
  end,
  color = { fg = colors.fg, gui = "bold" },
}

ins_right {
  "filetype",
  icons_enabled = true,
}

ins_right {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = { fg = colors.yellow, bg = colors.bg },
}
