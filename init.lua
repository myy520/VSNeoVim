local SuperVim = {
  options = "SuperVim.Core.options",
}

for k,v in pairs(SuperVim) do
  require(v)
end
