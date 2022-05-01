local OPTIONS = vim.opt
local GLOBAL = vim.g

local optionsconfig = {
  backup = vsn.options.backup,
  title = vsn.options.title,
  titlestring = vsn.options.titlestring,
  clipboard = vsn.options.clipboard,
  completeopt = vsn.options.completeopt,
  conceallevel = vsn.options.conceallevel,
  fileencoding = vsn.options.fileencoding,
  hlsearch = vsn.options.hlsearch,
  ignorecase = vsn.options.ignorecase,
  mouse = vsn.options.mouse,
  pumheight = vsn.options.pumheight,
  showmode = vsn.options.showmode,
  showtabline = vsn.options.showtabline,
  smartcase = vsn.options.smartcase,
  smartindent = vsn.options.smartindent,
  splitbelow = vsn.options.splitbelow,
  splitright = vsn.options.splitright,
  swapfile = vsn.options.swapfile,
  timeoutlen = vsn.options.timeoutlen,
  undofile = vsn.options.undofile,
  updatetime = vsn.options.updatetime,
  writebackup = vsn.options.writebackup,
  expandtab = vsn.options.expandtab,
  shiftwidth = vsn.options.shiftwidth,
  tabstop = vsn.options.tabstop,
  cursorline = vsn.options.cursorline,
  number = vsn.options.number,
  relativenumber = vsn.options.relativenumber,
  numberwidth = vsn.options.numberwidth,
  signcolumn = vsn.options.signcolumn,
  wrap = vsn.options.wrap,
  scrolloff = vsn.options.scrolloff,
  sidescrolloff = vsn.options.sidescrolloff,
  background = vsn.options.background,
  cmdheight = vsn.options.cmdline,
}
local globalconfig = {
  colors_name = vsn.global.theme,
}

for k, v in pairs(vsn.options) do
  OPTIONS[k] = v
end 
for k, v in pairs(vsn.global) do
  GLOBAL[k] = v
end
for k, v in pairs(globalconfig) do
  GLOBAL[k] = v
end
for k, v in pairs(optionsconfig) do
  OPTIONS[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
