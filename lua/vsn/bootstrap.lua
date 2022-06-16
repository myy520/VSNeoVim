local C = {}

local utils = require("vsn.utils")

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. VSNeoVim requires v0.7+", vim.log.levels.WARN)
  vim.wait(4000, function()
    return false
  end)
  vim.cmd "cquit"
end

function _G.get_runtime_dir()
  local vsn_runtime_dir = os.getenv "VSN_RUNTIME_DIR"
  if not vsn_runtime_dir then
    return vim.call("stdpath", "data")
  end
  return vsn_runtime_dir
end

function C:init()
  require("vsn.dconf.settings").load_options()
  require("vsn.shortcuts")
end

return C
