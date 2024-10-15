return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = 'storm',
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				-- styles = {
				-- 	transparency = true
				-- },
				highlight_groups = {
					TelescopeBorder = { fg = "subtle", bg = "none" },
					TelescopeNormal = { bg = "none" },
					TelescopePromptNormal = { bg = "none" },
					TelescopeResultsNormal = { fg = "subtle", bg = "none" },
					TelescopeSelection = { fg = "text", bg = "none" },
					TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				}
			})
			vim.cmd([[colorscheme rose-pine-moon]])
		end
	}
}
