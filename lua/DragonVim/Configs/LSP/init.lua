local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "DragonVim.Configs.LSP.lsp-installer"
require("DragonVim.Configs.LSP.handlers").setup()
require "DragonVim.Configs.LSP.null-ls"
