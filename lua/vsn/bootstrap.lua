local C = {}
local XDG_CFG_HOME = "$HOME/.config/vsn"
local XDG_CFG_DATA = "$HOME/.config/VSNeoVim/data"
local XDG_CFG_CACHE = "$HOME/.config/VSNeoVim/cache"
local stdpath = vim.fn.stdpath

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. VSNeoVim requires v0.7+", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

function set_config_dir()
  stdpath = function(value)
    if value == "config" then
      return XDG_CFG_HOME
    end
    return stdpath("config")
  end
  local CONFIG_PATH = stdpath('config')
  vim.cmd('luafile ' .. CONFIG_PATH .. "/config.lua")
end

function requires_setup_config()
  require("vsn.options")      -- options
  require("vsn.keymaps")      -- keymaps
  require("vsn.plugins")      -- plugins
  require("vsn.dconf.cursor")       -- cursor
  require("vsn.dconf.dconf")        -- default config
end

function C:init()
  self.config_dir = set_config_dir()
  self.requires_setup = requires_setup_config()
end

return C
