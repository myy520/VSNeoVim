local C = {}

local utils = require("vsn.utils")

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. VSNeoVim requires v0.7+", vim.log.levels.WARN)
  vim.wait(4000, function()
    return false
  end)
  vim.cmd "cquit"
end

function _G.get_data_home()
  local vsn_data_home = os.getenv "XDG_DATA_HOME"
  if not vsn_data_home then
    return vim.call("stdpath", "data")
  end
  return vsn_data_home
end

function _G.get_runtime_dir()
  local vsn_runtime_dir = os.getenv "VSN_RUNTIME_DIR"
  return vsn_runtime_dir
end

function _G.get_config_dir()
  local vsn_config_dir = os.getenv "VSN_CONFIG_DIR"
  if not vsn_config_dir then
    return vim.call("stdpath", "config")
  end
  return vsn_config_dir
end

function _G.get_cache_dir()
  local vsn_cache_dir = os.getenv "VSN_CACHE_DIR"
  if not vsn_cache_dir then
    return vim.call("stdpath", "cache")
  end
  return vsn_cache_dir
end

function C:init()
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.cache_dir = get_cache_dir()

  vim.fn.stdpath = function(what)
    if what == "data" then
      return _G.get_data_home() .. "/vsneovim-data"
    elseif what == "config" then
      return _G.get_config_dir()
    elseif what == "cache" then
      return _G.get_cache_dir()
    end
    return vim.call("stdpath", what)
  end

  require("vsn.dconf.settings").load_options()
  require("vsn.shortcuts")
end

return C
