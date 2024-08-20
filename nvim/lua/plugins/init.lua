return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',


  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'romgrk/barbar.nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
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
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  'mbbill/undotree',

  "ray-x/lsp_signature.nvim",

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  "lukas-reineke/indent-blankline.nvim",

  'windwp/nvim-ts-autotag',

  'numToStr/Comment.nvim',

  'tpope/vim-surround',
  'tpope/vim-repeat',

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  "ellisonleao/gruvbox.nvim",
  'AlexvZyl/nordic.nvim',
  "rebelot/kanagawa.nvim",

  "airblade/vim-gitgutter",
  "RRethy/vim-illuminate",

  {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  'nacro90/numb.nvim',

  'mhartington/formatter.nvim',

  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "<leader>nd", function() require("notebook-navigator").move_cell "d" end },
      { "<leader>nu", function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X",  "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x",  "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "hkupty/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      -- "benlubas/molten-nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },

  "LunarVim/bigfile.nvim",
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        symbol_folding = {
          autofold_depth = 1,
          auto_unfold = {
            hovered = true,
          },
        },
        outline_window = {
          auto_jump = true,
          width = 15,
        },
      }
    end,
  },

  {
    'dnlhc/glance.nvim',
    config = function()
      local glance = require('glance')
      glance.setup({
        border = {
          enable = true,
        },
      })
    end,
  },
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "llama3",
    },
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

}
