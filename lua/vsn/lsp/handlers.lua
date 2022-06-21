local C = {}

C.capabilities = vim.lsp.protocol.make_client_capabilities()

C.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = " " },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = {
      enable = true,
      prefix = " ",
      source = "always",
    },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- if client.server_capabilities.document_highlight then
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

C.on_attach = function(client)
  -- TODO: refactor this into a method that checks if string in list

  if client.name == "jdt.ls" then
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap { hotcodereplace = "auto" }
      require("jdtls.dap").setup_dap_main_class_configs()
    end
    C.capabilities.textDocument.completion.completionItem.snippetSupport = false
    vim.lsp.codelens.refresh()
  else
    local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not status_cmp_ok then
      return
    end

    C.capabilities.textDocument.completion.completionItem.snippetSupport = true
    C.capabilities = cmp_nvim_lsp.update_capabilities(C.capabilities)
  end

  lsp_highlight_document(client)
end

function C.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = true }) 
    augroup end
  ]]
  vim.notify "Enabled format on save"
end

function C.disable_format_on_save()
  C.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function C.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    C.enable_format_on_save()
  else
    C.disable_format_on_save()
  end
end

function C.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("vsn.lsp.handlers").toggle_format_on_save()' ]]

return C
