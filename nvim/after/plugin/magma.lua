vim.keymap.set("n", "<leader>rl", vim.cmd.MagmaEvaluateLine)
vim.keymap.set("x", "<leader>r", vim.cmd.MagmaEvaluateVisual)
vim.keymap.set("n", "<leader>rc", vim.cmd.MagmaReevaluateCell)
vim.keymap.set("n", "<leader>rd", vim.cmd.MagmaDelete)
vim.keymap.set("n", "<leader>ro", vim.cmd.MagmaShowOutput)

vim.g.magma_image_provider = "kitty"
