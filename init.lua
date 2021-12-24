local SuperVim = {
  -- Core
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",
  -- Configs
  FileExplorer = "SuperVim.Configs.FileExplorer",
  BufferLine = "SuperVim.Configs.BufferLine",
  LuaLine = "SuperVim.Configs.LuaLine",
  Terminal = "SuperVim.Configs.Terminal",
  Project = "SuperVim.Configs.Project",
  Impatient = "SuperVim.Configs.Impatient",
  IndentLine = "SuperVim.Configs.IndentLine",
  Alpha = "SuperVim.Configs.Alpha",
  WhichKey = "SuperVim.Configs.WhichKey",
  CMP = "SuperVim.Configs.CMP",
}

for k,v in pairs(SuperVim) do
  require(v)
end
