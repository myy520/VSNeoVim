local SuperVim = {
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",
}

for k,v in pairs(SuperVim) do
  require(v)
end
