local colors = {
  bg = "#2D313A",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {"NvimTree", "alpha", "statify", "dashboard", "Outline"},
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
  color = {
    fg = colors.fg,
  }
}

ins_left {
  "filename",
  color = { fg = colors.fg },
  cond = nil,
}

ins_left {
  'diagnostics',
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = {fg= colors.red},
    warn  = {fg= colors.yellow},
    info  = {fg= colors.blue},
    hint  = {fg= colors.green},
  },
  sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint"},
	update_in_insert = true,
	always_visible = false,
}


ins_left {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
    if venv then
      return string.format("  (%s)", env_cleanup(venv))
    end
    venv = os.getenv "VIRTUAL_ENV"
    if venv then
      return string.format("  (%s)", env_cleanup(venv))
    end
    return ""
  end
  return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}


-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_left {
  function()
    return '%='
  end,
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
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
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
  color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  'filetype',
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

-- Now don't forget to initialize lualine
require("lualine").setup(config)
