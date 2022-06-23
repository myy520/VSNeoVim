local C = {}

local core = {
  alpha = "vsn.core.alpha",
  nvimTree = "vsn.core.nvimTree",
  autopairs = "vsn.core.autopairs",
  cmp = "vsn.core.cmp",
  treesitter = "vsn.core.treesitter",
  notify = "vsn.core.notify",
  telescope = "vsn.core.telescope",
  comment = "vsn.core.comment",
  gitsigns = "vsn.core.gitsigns",
  whichkey = "vsn.core.whichkey",
  project = "vsn.core.project",
  bufferline = "vsn.core.bufferline",
  lualine = "vsn.core.lualine",
  terminal = "vsn.core.terminal",
  tagbar = "vsn.core.tagbar",
  debuging = "vsn.core.dap",
  colorizer = "vsn.core.colorizer",
  lazygit = "vsn.core.lazygit",
}

function C:load()
  for _,v in pairs(core) do
    require(v)
  end
end

return C
