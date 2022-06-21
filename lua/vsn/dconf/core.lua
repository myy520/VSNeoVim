local C = {}

local core = {
  alpha = "vsn.core.alpha",
  nvimTree = "vsn.core.nvimTree",
  autopairs = "vsn.core.autopairs",
  cmp = "vsn.core.cmp",
}

function C:load()
  for _,v in pairs(core) do
    require(v)
  end
end

return C
