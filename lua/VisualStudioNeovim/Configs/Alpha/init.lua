local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  "                      ########               ########                      ",
  "                    ############           ############                    ",
  "                   ##############         ##############                   ",
  "                  ################ ##### ################                  ",
  "                  #######################################                  ",
  "                  ################       ################                  ",
  "                   ##############         ##############                   ",
  "                    ############           ############                    ",
  "                      ########               ########                      ",
  "                    ###                             ###                    ",
  "                   ###                               ###                   ",
  "                   ###                               ###                   ",
  "                   ###                               ###                   ",
  "                   ###                               ###                   ",
  "                    ####                            ####                   ",
  "                     ####                          ####                    ",
  " db    db .d8888.   d8b   db d88888b  .d88b.  db    db d888888b .88b  d88. ",
  " 88    88 88'  YP   888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88 ",
  " Y8    8P `8bo.     88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88 ",
  " `8b  d8'   `Y8b.   88 V8o88 88~~~~~ 88    88 `8b  d8'    88    88  88  88 ",
  "  `8bd8'  db   8D   88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88 ",
  "    YP    `8888Y'   VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP ",
}
dashboard.section.buttons.val = {
	dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
	dashboard.button("p", "  Recent Projects", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":edit ~/.config/nvim/lua/VisualStudioNeovim/<CR>"),
}

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
