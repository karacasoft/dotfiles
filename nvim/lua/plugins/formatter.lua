return {
  'mhartington/formatter.nvim',
  config = function()
    vim.keymap.set({ "n", "x" }, "<leader>lf", function()
      vim.cmd("Format")
    end, { silent = true })
  end
}
