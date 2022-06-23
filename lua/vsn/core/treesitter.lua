local utils = require "vsn.utils"

local ts_config = utils.require_clean "nvim-treesitter.configs"

ts_config.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "jsonc", "fusion", "ocamllex" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
