return {
	'folke/todo-comments.nvim',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require('Comment').setup({
		  toggler = {
		    line = '<leader>/',
		  },
		  opleader = {
		    line = '<leader>/',
		  }
		})
	end
}
