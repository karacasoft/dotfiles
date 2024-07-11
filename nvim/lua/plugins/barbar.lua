return {
  'romgrk/barbar.nvim',
  config = function()
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)
    vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
    vim.keymap.set("n", "<A-m>h", "<Cmd>BufferMovePrevious<CR>", opts)
    vim.keymap.set("n", "<A-m>l", "<Cmd>BufferMoveNext<CR>", opts)

    vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
    vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
    vim.keymap.set("n", "<A-C>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)
    vim.keymap.set("n", "<A-j>", "<Cmd>BufferPick<CR>", opts)
  end
}
