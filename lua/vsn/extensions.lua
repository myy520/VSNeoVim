local utils = require("vsn.utils")
local packer = utils.require_clean("packer")

return packer.startup(function(use)

	-- packer
  use { "wbthomason/packer.nvim" }
  -- onedarker
  use { "vsneovim/onedarker.nvim" }
  -- icons
  use { "kyazdani42/nvim-web-devicons" }
  -- alpha
  use { "goolord/alpha-nvim" }
  -- nvim-tree
  use { "kyazdani42/nvim-tree.lua" }
  -- autopairs
  use { "windwp/nvim-autopairs" }
  -- lspconfig
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "glepnir/lspsaga.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  -- cmp
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  -- popup
  use { "nvim-lua/popup.nvim" }
  -- plenary
  use { "nvim-lua/plenary.nvim" }
  -- syntax highlighting (treesitter)
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- fix cursor hold
  use { "antoinemadec/FixCursorHold.nvim" }
  -- notifications (notify)
  use { "rcarriga/nvim-notify" }
  use { "nvim-telescope/telescope.nvim" }
  -- comment
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "numToStr/Comment.nvim" }
  -- git
  use { "lewis6991/gitsigns.nvim" }
  -- which-key
  use { "max397574/which-key.nvim" }
  -- project
  use { "ahmedkhalf/project.nvim" }
  -- bufferline
  use { "akinsho/bufferline.nvim" }
  -- statusline (bufferline)
  use { "nvim-lualine/lualine.nvim" }
  -- terminal
  use { "akinsho/toggleterm.nvim" }
  -- tagbar
  use { "simrat39/symbols-outline.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
