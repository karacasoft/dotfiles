local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false, desc = "Format" }
  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end


lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

lspconfig.vala_ls.setup({
  on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
})

lspconfig.ts_ls.setup({
  on_attach = on_attach,
})
