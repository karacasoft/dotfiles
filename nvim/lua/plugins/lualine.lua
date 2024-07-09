return {
  'nvim-lualine/lualine.nvim',
  requirements = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
      }
    })
  end
}
