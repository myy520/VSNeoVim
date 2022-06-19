local IPath = debug.getinfo(1, "S").source:sub(2)
local BASEDIR = IPath:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), BASEDIR) then
  vim.opt.rtp:append(BASEDIR)
end

require("vsn.bootstrap"):init(BASEDIR)

require("vsn.dconf.settings"):load_options()

require("vsn.shortcuts"):getshortcuts()

require("vsn.extension-loader"):init()
