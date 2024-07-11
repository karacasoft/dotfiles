return {
  'nvim-lualine/lualine.nvim',
  requirements = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
      }
    })
  end
}
