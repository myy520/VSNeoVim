local vsn = {
  -- Core
  options = "vsn.dconf.options",
  keymaps = "vsn.dconf.keymaps",
  plugins = "vsn.dconf.plugins",
  cursor = "vsn.dconf.cursor",
}
local Configs = {
  -- Configs
  FileExplorer = "vsn.Configs.FileExplorer",
  BufferLine = "vsn.Configs.BufferLine",
  LuaLine = "vsn.Configs.LuaLine",
  Terminal = "vsn.Configs.Terminal",
  Project = "vsn.Configs.Project",
  Impatient = "vsn.Configs.Impatient",
  IndentLine = "vsn.Configs.IndentLine",
  Alpha = "vsn.Configs.Alpha",
  WhichKey = "vsn.Configs.WhichKey",
  CMP = "vsn.Configs.CMP",
  LSP = "vsn.Configs.LSP",
  Tlescope = "vsn.Configs.Telescope",
  Colorizer = "vsn.Configs.Colorizer",
  Notification = "vsn.Configs.Notification",
  Treesitter = "vsn.Configs.Treesitter",
  Comments = "vsn.Configs.Comments",
  Autopairs = "vsn.Configs.Autopairs",
  Gitsigns = "vsn.Configs.Gitsigns",
  SymbolsOutline = "vsn.Configs.SymbolsOutline",
  DAP = "vsn.Configs.DAP",
  LazyGit = "vsn.Configs.LazyGit",
}

require("vsn.dconf.dconf")
require("vsn.dconf.utils")

for _,v in pairs(vsn) do
  pcall(require, v)
end
for _,v in pairs(Configs) do
  pcall(require, v)
end
