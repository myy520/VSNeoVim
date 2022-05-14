XDG_CFG_HOME = "$HOME/.config/vsn"
XDG_CFG_DATA = "$HOME/.config/VSNeoVim/data"
XDG_CFG_CACHE = "$HOME/.config/VSNeoVim/cache"

stdpath = vim.fn.stdpath

stdpath = function(value)
  if value == "config" then
    return XDG_CFG_HOME
  elseif value == "data" then
    return XDG_CFG_DATA
  elseif value == "cache" then
    return XDG_CFG_CACHE
  end
  return stdpath(value)
end

CONFIG_PATH = stdpath('config')
vim.cmd('luafile ' .. CONFIG_PATH .. "/config.lua")
