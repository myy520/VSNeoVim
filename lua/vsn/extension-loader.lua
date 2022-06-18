local extesion_loader = {}

local utils = require("vsn.utils")

function extesion_loader:init()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd "packadd packer.nvim"
  end

  local packer = utils.require_clean("packer")

  packer.init {
    plugin_package = "packer", -- The default package for plugins
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    disable_commands = false, -- Disable creating commands
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
    display = {
      non_interactive = false, -- If true, disable display windows for all operations
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
      open_cmd = "65vnew \\[packer\\]", -- An optional command to open a window for packer"s display
      working_sym = " ", -- The symbol for a plugin being installed/updated
      error_sym = "", -- The symbol for a plugin with an error in installation/updating
      done_sym = " ", -- The symbol for a plugin which has completed installation/updating
      removed_sym = " ", -- The symbol for an unused plugin which was removed
      moved_sym = "->", -- The symbol for a plugin which was moved (e.g. from opt to start)
      header_sym = "━", -- The symbol for the header line in packer"s display
      show_all_info = true, -- Should packer show all update details automatically?
      prompt_border = "double", -- Border style of prompt popups.
      keybindings = { -- Keybindings for the display window
        quit = "q",
        toggle_info = "<CR>",
        diff = "d",
        prompt_revert = "r",
      }
    },
    log = { level = "warn" }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  }

  local extensions = require("vsn.extensions")

  return packer.startup(function(use)
    for _, plugins in ipairs(extensions) do
      for _, plugin in ipairs(plugins) do
        use(plugin)
      end
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      packer.sync()
    end
  end)

end

return extesion_loader
