local C = {}

local core = {
  alpha = "vsn.core.alpha",
}

function C:load()
  for _,v in pairs(core) do
    pcall(require, v)
  end
end

return C
