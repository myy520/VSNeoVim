local extension_loader = {}

local utils = require("vsn.utils")

local compile_path = utils.join_paths(get_config_dir(), "plugin", "packer_compiled.lua")

return extension_loader
