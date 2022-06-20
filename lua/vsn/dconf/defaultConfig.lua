vsn = {
  shortcuts = {
    options = { noremap = true, silent = true },
    -- vim.keymap.set(mode, key, work, options)
  },
  options = {
    -- vim.opt.OPTION
    backup = false,
    number = true,
    shiftwidth = 2,
    tabstop = 2,
    theme = "onedarker"
  },
  extensions = {
    -- add your oter extensions with this template
    -- { "url" } 
    -- and write configiration to 'configs'
  },
  configs = {
    -- add your oter configs
    -- for example :
    --   vim.g.OPTION
    --   require("alpha")...
    --   and etc ...
    
    nvimTree = {open_fille_on_new_tab=false,width=32,position="left",icons=true,diagnostics=true,enable_git=true,hidden_ignore_files=true}
  },
}
