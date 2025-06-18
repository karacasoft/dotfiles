local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      }
    },
    {
      "neovim/nvim-lspconfig",
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      init = function()
        vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", {
          desc = "Find Files"
        })
        vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", {
          desc = "Live Grep"
        })
      end
    },
    {
      "nvim-lua/lsp-status.nvim",
    },
    { 'kosayoda/nvim-lightbulb' },
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
      opts = {
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, {
            desc = "Change root to parent",
            buffer = bufnr
          })
          vim.keymap.set("n", "l", api.node.open.edit, {
            desc = "Open",
            buffer = bufnr
          })
          vim.keymap.set("n", "h", api.node.navigate.parent_close, {
            desc = "Up",
            buffer = bufnr
          })
        end
      },
      init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", {
          desc = "Toggle File Explorer"
        })
      end,
    }, {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>gx",
        "<Cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics",
      }
    }
  }, {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {}
  },
    {
      "williamboman/mason.nvim",
      opts = {},
      init = function()
        vim.keymap.set("n", "<leader>mm", "<Cmd>Mason<CR>", {
          desc = "Mason (LSP)"
        })
        vim.keymap.set("n", "<leader>mi", "<Cmd>LspInfo<CR>", {
          desc = "Lsp Info"
        })
      end
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = true,
      }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,

          disable = function(lang, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end
        }
      }
    }, {
    "tpope/vim-surround"
  }, {
    'nvimdev/lspsaga.nvim',
    opts = {
      symbol_in_winbar = {
        enable = true
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>o", "<Cmd>Lspsaga outline<CR>", {
        desc = "Open outline"
      })
      vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", {
        desc = "Code actions"
      })
      vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", {
        desc = "Go to definition"
      })
      vim.keymap.set("n", "gD", "<Cmd>Lspsaga peek_definition<CR>", {
        desc = "Peek definition"
      })
      vim.keymap.set("n", "gr", "<Cmd>Lspsaga finder<CR>", {
        desc = "Go to references"
      })
      vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", {
        desc = "Show line diagnostics"
      })
      vim.keymap.set("n", "gL", "<Cmd>Lspsaga show_buf_diagnostics<CR>", {
        desc = "Show buffer diagnostics"
      })
      vim.keymap.set("n", "gW", "<Cmd>Lspsaga show_workspace_diagnostics<CR>", {
        desc = "Show workspace diagnostics"
      })
    end,
    event = 'LspAttach',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  }, {
    "mfussenegger/nvim-dap",
  }, {
    "rcarriga/nvim-dap-ui",
  }, {
    "mfussenegger/nvim-lint",
  }, {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", {
        desc = "Go to next buffer"
      })
      vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", {
        desc = "Go to previous buffer"
      })
      vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", {
        desc = "Close buffer"
      })
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }, {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "calc" },
          { name = "async_path" },
        })
      })
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-nvim-lsp",
      "FelipeLema/cmp-async-path",
    }
  }, {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<leader>/",
      },
      opleader = {
        line = "<leader>/",
      }
    },
    init = function()
    end
  },
    {
      "folke/tokyonight.nvim",
    },
    {
      "nvimtools/hydra.nvim",
      event = "VeryLazy",
      config = function()
        require("karacasoft.plugins.githydra")
      end
    },
    {
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = ' ̅' },
          changedelete = { text = '~' },
        },
        signcolumn = true,
      }
    },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = true,
    },
    {
      "hkupty/iron.nvim",
      config = function()
        local view = require("iron.view")
        local iron = require("iron.core")

        iron.setup({
          config = {
            command = "ipython --no-autoindent",
            repl_open_cmd = "belowright 8 split",
          }
        })
      end
    },
    {
      "GCBallesteros/NotebookNavigator.nvim",
      keys = {
        { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
        { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
      },
      dependencies = {
        "echasnovski/mini.comment",
        "hkupty/iron.nvim",
        "nvimtools/hydra.nvim",
      },
      event = "VeryLazy",
      config = function()
        local nn = require "notebook-navigator"
        nn.setup({ activate_hydra_keys = "<leader>nh" })
      end,
    },
    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
    },
    {
      "mbbill/undotree",
      keys = {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" }
      }
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    {
      "nyoom-engineering/oxocarbon.nvim",
      config = function()
        -- vim.cmd([[colorscheme oxocarbon]])
      end
    },
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      opts = {
        -- add any opts here
        -- for example
        -- provider = "claude",
        -- claude = {
        --   endpoint = "https://api.anthropic.com",
        --   model = "claude-3-5-sonnet-20241022",
        --   timeout = 30000, -- Timeout in milliseconds
        --   temperature = 0,
        --   max_tokens = 4096,
        -- }
        provider = "ollama",
        providers = {
          ollama = {
            endpoint = "http://localhost:11434",
            model = "qwen3:1.7b",
            extra_request_body = {
              options = {
                temperature = 0.3,
                num_ctx = 32768
              }
            }
          }
        }
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick",         -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua",              -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",        -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
    { 'AlphaTechnolog/pywal.nvim', config = true }
  },
  checker = {
    enabled = true,
  },
})
