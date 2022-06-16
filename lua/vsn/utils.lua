local C = {}

local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

function C.join_paths(path)
  local result = table.concat({ path }, path_sep)
  return result
end

function C.require_clean(module)
  local requested = pcall(require, module)
  return requested
end

return C
