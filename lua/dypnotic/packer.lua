-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Theme
	use 'folke/tokyonight.nvim'
	-- use 'nvim-tree/nvim-web-devicons'

	-- For Lua
	-- use 'nvim-lua/plenary.nvim'

	--LSP
	-- use 'neovim/nvim-lspconfig'
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
	-- Telescope
	-- use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Treesitter
	 use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- 	run = function()
	-- 		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	-- 		ts_update()
	-- 	end,
	-- }
	-- use 'nvim-tree/nvim-web-devicons'
end
)
