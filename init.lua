local SuperVim = {
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",

  FileExplorer = "SuperVim.Configs.FileExplorer",
  BufferLine = "SuperVim.Configs.BufferLine",
}

for k,v in pairs(SuperVim) do
  require(v)
end
