local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false, desc = "Format" }
  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end


vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

vim.lsp.config('clangd', {
  on_attach = on_attach
})

vim.lsp.config('cpptools', {
  on_attach = on_attach,
})

vim.lsp.config('vala_ls', {
  on_attach = on_attach,
})

vim.lsp.config('rust_analyzer', {
  on_attach = on_attach,
})

vim.lsp.config('pyright', {
  on_attach = on_attach,
})

vim.lsp.config('ts_ls', {
  on_attach = on_attach,
})
