-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')

  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use 'mbbill/undotree'

  use {
    "ray-x/lsp_signature.nvim",
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use "lukas-reineke/indent-blankline.nvim"

  use('windwp/nvim-ts-autotag')

  use {
    'numToStr/Comment.nvim',
  }

  use('tpope/vim-surround')
  use('tpope/vim-repeat')

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

  use { "ellisonleao/gruvbox.nvim" }
  use 'AlexvZyl/nordic.nvim'
  use "rebelot/kanagawa.nvim"

  use "airblade/vim-gitgutter"
  use "RRethy/vim-illuminate"

  use { 'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
  use 'nacro90/numb.nvim'

  use { 'mhartington/formatter.nvim' }


  --- Tabby plugin
  use { 'TabbyML/vim-tabby' }
end)
