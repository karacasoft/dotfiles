return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    local function onAttach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.del("n", "<C-k>", { buffer = bufnr })
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))

      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    end

    require("nvim-tree").setup({
      on_attach = onAttach
    })

  end
}
