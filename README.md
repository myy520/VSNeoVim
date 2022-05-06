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
    <img alt="GitHub release (latest SemVer)" src="https://img.shields.io/github/v/release/VSNeoVim/VSNeoVim">
  </a>
  <a href="https://github.com/VSNeoVim/VSNeoVim/commits">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/VSNeoVim/VSNeoVim">
  </a>
  <a href="https://github.com/VSNeoVim/VSNeoVim/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/vsneovim/vsneovim?style=flat&logo=GNU&label=License" alt="License">
  </a>
</div>

# Visual Studio NeoVim

## Documentation
You can find all the documentation for VSNeoVim at [wiki](https://github.com/VSNeoVim/VSNeoVim/wiki)

## Installation

```bash
bash <(curl -s https://raw.githubusercontent.com/vsneovim/vsneovim/main/utils/install.sh)
```

## Configuration file
To install plugins configure VSNeoVim use the `config.lua` located here: `~/.config/VSN/config.lua`

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
    theme = 'Darkup',
    Darkup_style = "dark",
  },
  keybindings = {
    localleader = " ",
    leader = " ",
  },
  extensions = {
    {"projekt0n/github-nvim-theme"},
  },
}
```


## Install Language support

- Enter `:LspInstall` followed by `<TAB>` to see your options for LSP

- Enter `:TSInstall` followed by `<TAB>` to see your options for syntax highlighting

## Screen environment

![Demo1](./media/1.png)
![Demo2](./media/2.png)
![Demo3](./media/3.png)
![Demo4](./media/4.png)
![Demo5](./media/5.png)
## Resources

- [Documentation](https://github.com/VSNeoVim/VSNeoVim/wiki)
- [Donate](https://www.payping.ir/@sameet)
