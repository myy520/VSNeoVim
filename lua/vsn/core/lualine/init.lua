local utils = require "vsn.utils"

lualine = utils.require_clean "lualine"

colors = utils.require_clean "vsn.core.lualine.colors"

lualineUTILS = utils.require_clean "vsn.core.lualine.utils"

conditions = utils.require_clean "vsn.core.lualine.conditions"

local config = {
  options = {
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "NvimTree", "alpha", "statify", "dashboard", "Outline" },
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
function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

components = utils.require_clean "vsn.core.lualine.components"

lualine.setup(config)
