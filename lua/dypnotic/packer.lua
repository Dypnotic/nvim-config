-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Theme
	use 'folke/tokyonight.nvim'
	use 'nvim-tree/nvim-web-devicons'

	-- For Lua
	use 'nvim-lua/plenary.nvim'

	--LSP
	use 'neovim/nvim-lspconfig'

	-- Telescope
	use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use 'nvim-tree/nvim-web-devicons'
	end
)
