local utils = require("vsn.utils")
local saga = utils.require_clean("lspsaga")

local config = {
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  diagnostic_header_icon = '   ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = ' ',
  finder_reference_icon = ' ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
  definition_preview_icon = ' ',
  border_style = "round",
  rename_prompt_prefix = '➤',
}

saga.init_lsp_saga(config)

local option = {silent = true, noremap=true}

vim.keymap.set("n", "gf", "<CMD>lua require'lspsaga.provider'.lsp_finder()<CR>", option)
vim.keymap.set("n", "ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", option)
vim.keymap.set("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", option)
vim.keymap.set("n", "F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
vim.keymap.set("n", "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",option)
vim.keymap.set("n", "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", option)
vim.keymap.set("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", option)
vim.keymap.set("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", option)
vim.keymap.set("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", option)
vim.keymap.set("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", option)
vim.keymap.set("n", "e[", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", option)
vim.keymap.set("n", "e]", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", option)
