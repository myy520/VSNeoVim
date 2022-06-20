local C = {}

local core = {
  alpha = "vsn.core.alpha",
  nvimTree = "vsn.core.nvimTree",
  autopairs = "vsn.core.autopairs",
}

function C:load()
  for _,v in pairs(core) do
    pcall(require, v)
  end
end

return C
