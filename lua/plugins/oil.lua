return {
	'stevearc/oil.nvim',
	---@module 'oil'
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require('oil').setup({
			columns = {
				"permissions",
				"mtime",
				"icon",
			},
			float = {
				padding = 5,
				preview_split = 'right'
			}
		})

		-- Toggle float window
		-- vim.keymap.set("n", "<leader>e", require("oil").toggle_float)
		vim.keymap.set("n", "<leader>e", '<cmd>Oil<CR>')

		-- Auto open preivew
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "OilEnter",
		-- 	callback = vim.schedule_wrap(function(args)
		-- 		local oil = require("oil")
		-- 		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
		-- 			oil.open_preview()
		-- 		end
		-- 	end),
		-- })
	end
}
