local utils = require("vsn.utils")

local null_ls = utils.require_clean("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.eslint,
  formatting.autopep8,
	formatting.stylua,
	formatting.prettier.with({
    filetype = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "html",
      "less",
      "json",
      "yaml",
      "markdown",
      "python",
      "lua",
      "bashe",
      "java",
      "php",
      "c",
      "cpp",
      "cs",
      "graphql",
      "handlebars",
    }
  }),
}

null_ls.setup({
  debug = false,
  sources = sources
})
