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
  LSP = "SuperVim.Configs.LSP",
  Tlescope = "SuperVim.Configs.Telescope",
  Colorizer = "SuperVim.Configs.Colorizer",
  Notification = "SuperVim.Configs.Notification",
  Treesitter = "SuperVim.Configs.Treesitter",
  Comments = "SuperVim.Configs.Comments",
  Autopairs = "SuperVim.Configs.Autopairs",
}

for k,v in pairs(SuperVim) do
  require(v)
end
