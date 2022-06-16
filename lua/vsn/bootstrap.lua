local C = {}

local utils = require("vsn.utils")

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. VSNeoVim requires v0.7+", vim.log.levels.WARN)
  vim.wait(4000, function()
    return false
  end)
  vim.cmd "cquit"
end

function C:init()
  require("vsn.dconf.settings").load_options()
  require("vsn.shortcuts")
end

return C
