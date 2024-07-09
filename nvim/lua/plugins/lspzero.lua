return {
  'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requirements = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr  })
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
        lsp_zero.default_setup
      },
    })

  end
}
