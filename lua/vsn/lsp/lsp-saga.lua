local utils = require "vsn.utils"
local saga = utils.require_clean "lspsaga"

local config = {
  diagnostic_header_icon = { " ", " ", " ", "ﴞ " },
  code_action_icon = " ",
  code_action_lightbulb = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = " ",
  finder_reference_icon = " ",
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  definition_preview_icon = " ",
  border_style = "round",
}

saga.init_lsp_saga(config)

local option = { silent = true, noremap = true }

vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", option)
vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", option)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", option)
vim.keymap.set("n", "F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", option)
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition", option)
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", option)
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", option)
vim.keymap.set("n", "e[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", option)
vim.keymap.set("n", "e]", "<cmd>Lspsaga diagnostic_jump_next<CR>", option)
