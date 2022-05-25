local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "VisualStudioNeovim.Configs.LSP.lsp-installer"
require("VisualStudioNeovim.Configs.LSP.handlers").setup()
require "VisualStudioNeovim.Configs.LSP.null-ls"

vim.cmd [[
  highlight! DiagnosticLineNrError guifg=#ec5f67 gui=bold
  highlight! DiagnosticLineNrWarn  guifg=#ECBE7B gui=bold
  highlight! DiagnosticLineNrInfo  guifg=#51afef gui=bold
  highlight! DiagnosticLineNrHint  guifg=#98be65 gui=bold

  sign define DiagnosticSignError text=  texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn  text=  texthl=DiagnosticSignWarn  linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo  text=  texthl=DiagnosticSignInfo  linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint  text=  texthl=DiagnosticSignHint  linehl= numhl=DiagnosticLineNrHint
]]
