local utils = require("vsn.utils")

local dap = utils.require_clean("dap")

local dapInstall = utils.require_clean("dap-install")

local dapUI = utils.require_clean("dapui")

local dapUIConfig = {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}

local dapInstallConfig = {
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
}

dapInstall.setup(dapInstallConfig)

local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
  dapInstall.config(debugger)
end

dapUI.setup(dapUIConfig)

vim.fn.sign_define('DapBreakpoint', {text='● ', texthl='DiagnosticSignError', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='● ', texthl='DiagnosticSignWarn', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text=' ', texthl='DiagnosticSignInfo', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text=' ', texthl='DiagnosticSignWarn', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointReject', {text=' ' , texthl='DiagnosticSignHint', linehl='', numhl=''})
