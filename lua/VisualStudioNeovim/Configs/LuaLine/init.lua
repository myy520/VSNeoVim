local colors = {
    bg = "#117DC6",
    fg = "#ffffff",
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

-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- }

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

-- Add components to right sections
ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    added = { fg = colors.fg },
    modified = { fg = colors.fg },
    removed = { fg = colors.fg },
  },
}

ins_left {
   function(msg)
    msg = msg or " Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return " Inactive"
      end
      return msg
    else
      return "﫟"
    end
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    return table.concat(buf_client_names, ", ")
  end,
  color = { gui = "bold", fg= colors.fg},
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
  color = { fg = colors.fg },
  cond = conditions.hide_in_width,
}


ins_left {
  'diagnostics',
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = {fg= colors.fg},
    warn  = {fg= colors.fg},
    info  = {fg= colors.fg},
    hint  = {fg= colors.fg},
  },
  sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint"},
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
  }
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_left {
  function()
    return '%='
  end,
}



ins_right {
  'location',
  fmt = function(str)
    return "Ln:" .. string.sub(str, 1, 3) .. "," .. "Col:" .. string.sub(str, 5)
  end,
  color = { fg = colors.fg, gui = 'bold' },

}

ins_right {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end
}


ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = 'bold' },
}


ins_right {
   function(msg)
    msg = msg or ""
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return ""
      end
      return msg
    end
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    return table.concat(buf_client_names, ", ")
  end,
  color = { gui = "bold", fg= colors.fg},
}

ins_right {
  'filetype',
  icons_enabled = false,
}

-- Now don't forget to initialize lualine
require("lualine").setup(config)
