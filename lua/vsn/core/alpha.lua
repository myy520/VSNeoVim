local utils = require("vsn.utils")

local alpha = utils.require_clean("alpha")

local dashboard = utils.require_clean("alpha.themes.dashboard")

local header = {
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
local buttons = {
  dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
  dashboard.button("p", "  Recent Projects", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  configuration", ":edit ~/.config/vsn/config.lua<CR>"),
}
local types = {
  header = "Include",
  buttons = "Keyword",
  footer = "Type",
}
local footer = {
  text = "v 2.0.0"
}
noautocmd = true

dashboard.section.header.val = header

dashboard.section.buttons.val = buttons

dashboard.section.header.opts.hl = types.header

dashboard.section.buttons.opts.hl = types.buttons

dashboard.section.footer.opts.hl = types.footer

dashboard.section.footer.val = footer.text

dashboard.opts.opts.noautocmd = noautocmd

alpha.setup(dashboard.opts)
