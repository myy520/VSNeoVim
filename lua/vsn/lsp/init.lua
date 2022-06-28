local C = {}

function C:init()
  require("vsn.lsp.handlers").setup()
  require "vsn.lsp.lsp-saga"
  require "vsn.lsp.lsp-installer"
  require "vsn.lsp.null-ls"
end

return C
