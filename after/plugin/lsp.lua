local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_isntalled({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function(client,bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()
