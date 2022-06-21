local utils = require("vsn.utils")

local lsp_installer = utils.require_clean("nvim-lsp-installer")

local lsp_config = utils.require_clean("lspconfig")

local servers = {
  "cssls",
  "emmet_ls",
  "html",
  "sumneko_lua",
  "tsserver",
  "pyright",
}

local settings = {
  ensure_installed = servers,
  ui = {
    icons = {
      server_installed = " ",
      server_pending = "➜ ",
      server_uninstalled = "",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },

  log_level = vim.log.levels.INFO,
}

lsp_installer.setup(settings)

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("vsn.lsp.handlers").on_attach,
    capabilities = require("vsn.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "vsn.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "vsn.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "vsn.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  lsp_config[server].setup(opts)
end
