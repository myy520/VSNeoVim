local core = {
  -- core
  FileExplorer = "vsn.core.FileExplorer",
  BufferLine = "vsn.core.BufferLine",
  LuaLine = "vsn.core.LuaLine",
  Terminal = "vsn.core.Terminal",
  Project = "vsn.core.Project",
  Impatient = "vsn.core.Impatient",
  IndentLine = "vsn.core.IndentLine",
  Alpha = "vsn.core.Alpha",
  WhichKey = "vsn.core.WhichKey",
  CMP = "vsn.core.CMP",
  LSP = "vsn.core.LSP",
  Tlescope = "vsn.core.Telescope",
  Colorizer = "vsn.core.Colorizer",
  Notification = "vsn.core.Notification",
  Treesitter = "vsn.core.Treesitter",
  Comments = "vsn.core.Comments",
  Autopairs = "vsn.core.Autopairs",
  Gitsigns = "vsn.core.Gitsigns",
  SymbolsOutline = "vsn.core.SymbolsOutline",
  DAP = "vsn.core.DAP",
  LazyGit = "vsn.core.LazyGit",
}

require("vsn.bootstrap"):init()

for _,v in pairs(core) do
  pcall(require, v)
end
