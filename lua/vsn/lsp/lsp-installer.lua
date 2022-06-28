local utils = require("vsn.utils")

local LSPI = utils.require_clean("nvim-lsp-installer")

local LSPC = utils.require_clean("lspconfig")

local config = {
  automatic_installation = true,
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
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
  },
  log_level = vim.log.levels.INFO,
}

LSPI.setup(config)

for _, server in ipairs(LSPI.get_installed_servers()) do
  LSPC[server.name].setup {}
end

LSPC['sumneko_lua'].setup{settings = utils.require_clean("vsn.lsp.settings.sumneko_lua")}
LSPC['pyright'].setup{settings = utils.require_clean("vsn.lsp.settings.pyright")}
