local SuperVim = {
  -- Core
  options = "SuperVim.Core.options",
  plugins = "SuperVim.Core.plugins",
  cursor = "SuperVim.Core.cursor",
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
  Gitsigns = "SuperVim.Configs.Gitsigns",
}

for k,v in pairs(SuperVim) do
  require(v)
end
