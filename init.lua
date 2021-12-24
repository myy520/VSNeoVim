local SuperVim = {
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",

  FileExplorer = "SuperVim.Configs.FileExplorer",
}

for k,v in pairs(SuperVim) do
  require(v)
end
