local SuperVim = {
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",

  FileExplorer = "SuperVim.Configs.FileExplorer",
  BufferLine = "SuperVim.Configs.BufferLine",
  LuaLine = "SuperVim.Configs.LuaLine",
  Terminal = "SuperVim.Configs.Terminal",
  Project = "SuperVim.Configs.Project",
  Impatient = "SuperVim.Configs.Impatient",
  IndentLine = "SuperVim.Configs.IndentLine",
}

for k,v in pairs(SuperVim) do
  require(v)
end
