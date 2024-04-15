return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",      -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim"     -- Optional, for persistent history
		},
		config = function()
			vim.opt.termguicolors = true
			require('cokeline').setup {
				components = {
					{
						text = function(buffer)
							return " " .. buffer.devicon.icon
						end,
						fg = function(buffer)
							return buffer.devicon.color
						end,
					},
					{
						text = function(buffer)
							return buffer.unique_prefix
						end,
						fg = function(buffer)
							return buffer.is_focused and "#B24BF3" or "#cdcdcd"
						end,
						style = "italic",
					},
					{
						text = function(buffer)
							return buffer.filename
						end,
						style = function(buffer)
							return buffer.is_focused and "bold" or nil
						end,
					},
					{
						text = function(buffer)
							return buffer.is_modified and " 󰙏" or " "
						end,
					},
				}
			}
		end
	}
}
