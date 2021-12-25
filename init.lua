local DragonVim = {
  -- Core
  options = "DragonVim.Core.options",
  keymaps = "DragonVim.Core.keymaps",
  plugins = "DragonVim.Core.plugins",
  cursor = "DragonVim.Core.cursor",
  -- Configs
  FileExplorer = "DragonVim.Configs.FileExplorer",
  BufferLine = "DragonVim.Configs.BufferLine",
  LuaLine = "DragonVim.Configs.LuaLine",
  Terminal = "DragonVim.Configs.Terminal",
  Project = "DragonVim.Configs.Project",
  Impatient = "DragonVim.Configs.Impatient",
  IndentLine = "DragonVim.Configs.IndentLine",
  Alpha = "DragonVim.Configs.Alpha",
  WhichKey = "DragonVim.Configs.WhichKey",
  CMP = "DragonVim.Configs.CMP",
  LSP = "DragonVim.Configs.LSP",
  Tlescope = "DragonVim.Configs.Telescope",
  Colorizer = "DragonVim.Configs.Colorizer",
  Notification = "DragonVim.Configs.Notification",
  Treesitter = "DragonVim.Configs.Treesitter",
  Comments = "DragonVim.Configs.Comments",
  Autopairs = "DragonVim.Configs.Autopairs",
  Gitsigns = "DragonVim.Configs.Gitsigns",
  SymbolsOutline = "DragonVim.Configs.SymbolsOutline",
}

for k,v in pairs(DragonVim) do
  require(v)
end
