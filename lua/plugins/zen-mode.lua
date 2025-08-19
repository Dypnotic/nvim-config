return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>z",
			"<cmd>ZenMode<cr>",
			desc = "ZenMode",
		},
	},
	opts = {
		window = {
			backdrop = 1,

		},
		neovide = {
			enabled = true,
			-- Will multiply the current scale factor by this number
			scale = 1.2,
			-- disable the Neovide animations while in Zen mode
			disable_animations = {
				neovide_animation_length = 0.15,
				neovide_cursor_animate_command_line = true,
				neovide_scroll_animation_length = 0.1,
				neovide_position_animation_length = 0.1,
				neovide_cursor_animation_length = 0.3,
				neovide_cursor_vfx_mode = "railgun",
			}
		},
	}
}
