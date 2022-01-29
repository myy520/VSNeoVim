local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end


if vim.fn.has("win32") == 1 then
  plugins_count = vim.fn.len(vim.fn.globpath("~/AppData/Local/nvim-data/site/pack/packer/start", "*", 0, 1))
else
  plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  '',
  'db    db .d8888.     d8b   db d88888b  .d88b.  db    db d888888b .88b  d88. ',
  "88    88 88'  YP     888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88 ",
  'Y8    8P `8bo.       88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88 ',
  "`8b  d8'   `Y8b.     88 V8o88 88~~~~~ 88    88 `8b  d8'    88    88  88  88 ",
  " `8bd8'  db   8D     88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88 ",
  "   YP    `8888Y'     VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP ",
}
dashboard.section.buttons.val = {
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("m", "  BookMarks", ":Telescope marks <CR>"),
  dashboard.button("e", "  Extensions ", ":e ~/.config/nvim/lua/VisualStudioNeovim/Core/plugins.lua<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/lua/VisualStudioNeovim/Core/options.lua<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}


dashboard.section.footer.val = {
  "",
  "--   VisualStudioNeovim Loaded " .. plugins_count .. " plugins    --",
  "",
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
