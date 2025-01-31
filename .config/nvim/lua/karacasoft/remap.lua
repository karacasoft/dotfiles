vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", {
	desc = "Save"
})
vim.keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Go to window on left"
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Go to window on right"
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Go to window below"
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Go to window above"
})
vim.keymap.set("n", "y", "\"+y", {
    desc = "Copy to clipboard"
})
vim.keymap.set("v", "y", "\"+y", {
    desc = "Copy to clipboard"
})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
    desc = "Exit from terminal"
})
