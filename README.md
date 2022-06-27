```
                                  ########               ########                                  
                                ############           ############                                
                               ##############         ##############                               
                              ################ ##### ################                              
                              #######################################                              
                              ################       ################                              
                               ##############         ##############                               
                                ############           ############                                
                                  ########               ########                                  
                                ###                             ###                                
                               ###                               ###                               
                               ###                               ###                               
                               ###                               ###                               
                               ###                               ###                               
                                ####                            ####                               
                                 ####                          ####                                
             db    db .d8888.   d8b   db d88888b  .d88b.  db    db d888888b .88b  d88.             
             88    88 88'  YP   888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88             
             Y8    8P `8bo.     88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88             
             `8b  d8'   `Y8b.   88 V8o88 88~~~~~ 88    88 `8b  d8'    88    88  88  88             
              `8bd8'  db   8D   88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88             
                YP    `8888Y'   VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP             
```

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
  options = {
    backup = false,
    conceallevel = 0,
    fileencoding = 'utf-8',
    hlsearch = true,
    ignorecase = true,
    mouse = 'a',
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 100,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = 'yes',
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    background = 'dark',
    cmdheight = 2,
  },
  global = {
    theme = 'onedarker',
--    theme = 'Darkup',
  },
  keybindings = {
    localleader = " ",
    leader = " ",
  },
  extensions = {
    -- adding your extensions with this template
    -- {"url", run="", config="", etc...}
    {"VSNeoVim/Darkup.nvim"},
    {"VSNeoVim/onedarker.nvim"}
  },
  configs = {
    TreeIcons = {enabled = true},
    FileExplorer = {enabled = true, width = 30, position = "left", icons = true, diagnostics = true, open_file_on_new_tab = false, enable_git = true, hidden_ignore_files = true},
    BufferLine = {enabled = true},
    Terminal = {enabled = true},
    IndentLine = {enabled = true},
    WhichKey = {enabled = true},
    CMP = {enabled = true},
    LSP = {enabled = true, virtual_text = true, virtual_text_prefix = "● ", update_in_insert = true, underline = true},
    LSPInstaller = {enabled = true},
    Telescope = {enabled = true},
    Colorizer = {enabled = true},
    Tabnine = {enabled = true},
    Treesitter = {enabled = true},
    Git = {enabled = true},
    DAPInstall = {enabled = true},
    DAP = {enabled = true},
    DAPUI = {enabled = true},
    GitUi = {enabled = true},
  }
}
```
