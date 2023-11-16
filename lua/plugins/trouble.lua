return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = 'VeryLazy',
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xo", "<cmd>TroubleToggle<cr>",
				{ silent = true, noremap = true }
			)

			local signs = {
				Error = "⛔",
				Warn = "☢️",
				Hint = "♻️",
				Info = "💡",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end
	},
}
