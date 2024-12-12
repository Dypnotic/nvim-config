if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h9";
	vim.g.neovide_refresh_rate = 120;
	vim.g.neovide_remember_window_size = true;
	vim.g.neovide_cursor_animation_length = 0.03;
	vim.g.neovide_cursor_vfx_mode = "railgun";
	vim.g.neovide_scroll_animation_lenght = 0.1;
	vim.g.neovide_floating_shadow = false;
	vim.g.nevoide_fullscreen = true;
	vim.g.neovide_title_background_color = "green"


	vim.keymap.set('v', '<C-c>', '"+y')        -- Copy
	vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end
