local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "SuperVim.Configs.LSP.lsp-installer"
require("SuperVim.Configs.LSP.handlers").setup()
require "SuperVim.Configs.LSP.null-ls"
