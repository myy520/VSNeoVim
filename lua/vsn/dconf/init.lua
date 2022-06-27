local C = {}

function C:load()
  local utils = require "vsn.utils"

  require "vsn.dconf.defaultConfig"

  vim.cmd('luafile ' .. vim.fn.stdpath("config") .. "/config.lua")

  utils.require_clean("vsn.dconf.settings").load_options()

  require("vsn.dconf.core"):load()
end

return C
