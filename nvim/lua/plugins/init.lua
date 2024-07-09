return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  },

  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'romgrk/barbar.nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requirements = {
      --- Uncomment these if you want to manage LSP servers from neovim
    }
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- LSP Support
  { 'neovim/nvim-lspconfig' },
  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },

  'mbbill/undotree',

  {
    "ray-x/lsp_signature.nvim",
  },

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  "lukas-reineke/indent-blankline.nvim",

  'windwp/nvim-ts-autotag',

  {
    'numToStr/Comment.nvim',
  },

  'tpope/vim-surround',
  'tpope/vim-repeat',

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' },

  "ellisonleao/gruvbox.nvim",
  'AlexvZyl/nordic.nvim',
  "rebelot/kanagawa.nvim",

  "airblade/vim-gitgutter",
  "RRethy/vim-illuminate",

  {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  'nacro90/numb.nvim',

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  "tpope/vim-obsession",

  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  }
}
