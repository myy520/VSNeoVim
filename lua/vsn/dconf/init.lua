local C = {}

function C:load()
  require "vsn.dconf.defaultConfig"

  vim.cmd("luafile " .. vim.fn.stdpath "config" .. "/config.lua")

  require("vsn.dconf.settings").load_options()

  require("vsn.dconf.core"):load()
end

return C
