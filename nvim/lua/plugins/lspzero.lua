return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    --- Uncomment these if you want to manage LSP servers from neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- LSP Support
    'neovim/nvim-lspconfig',
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr }

      vim.keymap.set({ "n", "x" }, "<leader>lf", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end, opts)
    end)

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = true,
      handlers = {
        lsp_zero.default_setup,

        ["pylsp"] = function()
          require("lspconfig").pylsp.setup({
            settings = {
              pylsp = {
                plugins = {
                  pycodestyle = {
                    ignore = { "E501", },
                  },
                  rope_autoimport = {
                    enabled = true,
                  },
                }
              }
            }
          })
        end,
        ["jsonls"] = function()
          require("lspconfig").jsonls.setup({
            filetypes = { "json", "jsonc" },
            settings = {
              json = {
                -- Schemas https://www.schemastore.org
                schemas = {
                  {
                    fileMatch = { "package.json" },
                    url = "https://json.schemastore.org/package.json"
                  },
                  {
                    fileMatch = { "tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json"
                  },
                  {
                    fileMatch = {
                      ".prettierrc",
                      ".prettierrc.json",
                      "prettier.config.json"
                    },
                    url = "https://json.schemastore.org/prettierrc.json"
                  },
                  {
                    fileMatch = { ".eslintrc", ".eslintrc.json" },
                    url = "https://json.schemastore.org/eslintrc.json"
                  },
                  {
                    fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                    url = "https://json.schemastore.org/babelrc.json"
                  },
                  {
                    fileMatch = { "lerna.json" },
                    url = "https://json.schemastore.org/lerna.json"
                  },
                  {
                    fileMatch = { "now.json", "vercel.json" },
                    url = "https://json.schemastore.org/now.json"
                  },
                  {
                    fileMatch = {
                      ".stylelintrc",
                      ".stylelintrc.json",
                      "stylelint.config.json"
                    },
                    url = "http://json.schemastore.org/stylelintrc.json"
                  }
                }
              }
            }
          })
        end,
      },
    })
  end
}
