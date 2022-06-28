<div align="center">
  <img src="https://user-images.githubusercontent.com/85228025/176026682-66f3bce6-f7ff-4e11-9dae-b09906228308.png" alt="logo">
</div>

<div align="center">
  <a href="https://github.com/VSNeoVim/VSNeoVim/releases/latest">
    <img alt="GitHub release (latest by date including pre-releases)" src="https://img.shields.io/github/v/release/VSNeoVim/VSNeoVim?include_prereleases&style=flat-square">
  </a>
  <img src="https://img.shields.io/github/last-commit/VSNeoVim/VSNeoVim?color=%23007EC6&style=flat-square">
  <a href="">
    <img alt="GitHub" src="https://img.shields.io/github/license/VSNeoVim/VSNeoVim?color=%23007EC6&style=flat-square">
  </a>
</div>

## Showcase
![2022-06-26_16-47](https://user-images.githubusercontent.com/85228025/175995992-3409976d-7ac1-4d38-a243-ac49565ac39b.png)
![2022-06-26_18-07](https://user-images.githubusercontent.com/85228025/175996015-2baa6f88-58c3-42e6-9821-88e3159e1fc7.png)
![2022-06-27_20-37](https://user-images.githubusercontent.com/85228025/175996060-ce105e6f-beef-43f6-a6c4-a251a4e1207a.png)
![2022-06-27_21-40](https://user-images.githubusercontent.com/85228025/175997527-3f4c6bc3-d124-4051-a914-9e70b6c2dd63.png)

NOTE: for running VSNeoVim write ``$ vsn`` or ``$ vsn [file]`` command

## Installation
```bash
bash <(curl -s https://raw.githubusercontent.com/vsneovim/vsneovim/main/utils/installer/install.sh)
```
## Configuration file
To install plugins configure VSNeoVim use the `config.lua` located here: `~/.config/vsn/config.lua`

Example : 

```lua
vsn = {
  shortcuts = {
    options = { noremap = true, silent = true },
    leaderKey = " ",
    -- vim.keymap.set(mode, key, work, options)
  },
  options = {
    -- vim.opt.OPTION
    backup = false,
    number = true,
    shiftwidth = 2,
    tabstop = 2,
    theme = "onedarker",
    auto_close_tags = true,
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

    nvimTree = {
      open_fille_on_new_tab = false,
      width = 32,
      position = "left",
      icons = true,
      diagnostics = true,
      enable_git = true,
      hidden_ignore_files = true,
      active = true,
    },
    useIcon = { active = true },
    LSP = { active = true },
    CMP = { active = true },
    Treesitter = { active = true },
    Telescope = { active = true },
    Git = { active = true },
    WhichKey = { active = true },
    BufferLine = { active = true },
    Terminal = { active = true },
    DAP = { active = true },
    Colorizer = { active = true },
    Tabnine = { active = true },
    IndentLine = { active = true },
  },
}
```
