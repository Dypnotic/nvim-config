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
			require('rose-pine').setup {
				styles = {
					transparency = true
				},
				highlight_groups = {
					TelescopeBorder = { fg = "highlight_high", bg = "none" },
					TelescopeNormal = { bg = "none" },
					TelescopePromptNormal = { bg = "base" },
					TelescopeResultsNormal = { fg = "subtle", bg = "none" },
					TelescopeSelection = { fg = "text", bg = "base" },
					TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
					CursorLine = { bg = 'none'},
				}
			}
			vim.cmd([[colorscheme rose-pine-main]])
		end
	}
}
