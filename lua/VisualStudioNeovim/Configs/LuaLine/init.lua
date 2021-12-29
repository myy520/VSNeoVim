local colors = {
    bg = "#282C34",
    fg = "#ffffff",
    blue = "#51afef",
    yellow = "#e0af68",
    cyan = "#00b4b4",
    darkblue = "#081633",
    green = "#10B981",
    orange = "#FF8800",
    magenta = "#c678dd",
    red = "#db4b4b",
}
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
    disabled_filetypes = {"NvimTree"},
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
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left {
  'diagnostics',
  symbols = { error = ' ', warn = ' ', info = ' ' },
  sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint"},
	update_in_insert = false,
	always_visible = true,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color= { fg = colors.magenta },
}

ins_left {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
  color = {
    fg = colors.blue,
  }
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
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
  icon = "  LSP:",
  color = { fg = colors.cyan, gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
}

ins_right { 'location',  color = { fg = colors.yellow, gui = 'bold' } }
ins_right { 'progress', color = { fg = colors.yellow, gui = 'bold' } }

ins_right {
  'filetype',
  icons_enabled = true,
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}


ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
require("lualine").setup(config)
