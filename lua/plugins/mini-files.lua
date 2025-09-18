return {
	'nvim-mini/mini.files',
	version = false,
	keys = {
		{'<leader>e', '<cmd>lua MiniFiles.open()<CR>'}, desc = 'Open file explorer',
	},
	config = function()
		require('mini.files').setup()
	end,
}
