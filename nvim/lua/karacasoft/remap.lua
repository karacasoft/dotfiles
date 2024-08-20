vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save"})

vim.keymap.set("n", "<C-h>", function() vim.cmd("winc h") end)
vim.keymap.set("n", "<C-j>", function() vim.cmd("winc j") end)
vim.keymap.set("n", "<C-k>", function() vim.cmd("winc k") end)
vim.keymap.set("n", "<C-l>", function() vim.cmd("winc l") end)

vim.keymap.set("n", "<leader>e", vim.cmd.Neotree, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>h", vim.cmd.noh)

vim.keymap.set("n", "<leader>gg", "<Cmd>LazyGit<CR>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree"})

vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("n", "Y", "\"+Y")

vim.keymap.set("x", "p", "\"_dP")

vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

