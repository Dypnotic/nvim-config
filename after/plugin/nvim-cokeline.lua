local get_hex = require('cokeline/utils').get_hex
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
				return buffer.is_modified and " ● " or " "
			end,
			fg = function(buffer)
				return buffer.is_focused and get_hex('Normal', 'bg') or get_hex('Normal', 'fg')
			end,
		},
	}
}
