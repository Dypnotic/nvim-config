-- basic settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.encoding = 'utf-8'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.copyindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.list = true

vim.g.mapleader = ' '

-- Stop healthcheck of unused providers:
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅙',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.HINT] = '󰌵',
			[vim.diagnostic.severity.INFO] = '',
		},
	},
})
