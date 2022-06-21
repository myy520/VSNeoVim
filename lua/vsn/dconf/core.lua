local C = {}

local core = {
  alpha = "vsn.core.alpha",
  nvimTree = "vsn.core.nvimTree",
  autopairs = "vsn.core.autopairs",
  cmp = "vsn.core.cmp",
  lsp = "vsn.lsp",
  treesitter = "vsn.core.treesitter",
  notify = "vsn.core.notify",
  telescope = "vsn.core.telescope",
  comment = "vsn.core.comment",
  gitsigns = "vsn.core.gitsigns",
}

function C:load()
  for _,v in pairs(core) do
    require(v)
  end
end

return C
