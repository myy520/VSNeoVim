local C = {}

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. VSNeoVim requires v0.7+", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

function get_runtime_dir()
  local vsn_runtime_dir = os.getenv("VSN_RUNTIME_DIR")
  return vsn_runtime_dir
end

function get_config_dir()
  local vsn_config_dir = os.getenv("VSN_CONFIG_DIR")
  return vsn_config_dir
end

function get_data_dir()
  local vsn_data_dir = os.getenv("XDG_DATA_HOME")
  return vsn_data_dir
end

function set_config_dir()
  vim.fn.stdpath = function(value)
    if value == "config" then
      return get_config_dir()
    end
    return vim.fn.stdpath("config")
  end
  local CONFIG_PATH = vim.fn.stdpath('config')
  vim.cmd('luafile ' .. CONFIG_PATH .. "/config.lua")
end

function C:init()
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.data_dir = get_data_dir()
  
  self.set_config_dir = set_config_dir()

  require("vsn.dconf.dconf")  -- default config
  require("vsn.options")      -- options
  require("vsn.keymaps")      -- keymaps
  require("vsn.plugins")      -- plugins
  require("vsn.dconf.cursor") -- cursor
end

return C
