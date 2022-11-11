--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Python
require'lspconfig'.pyright.setup{}

-- HTML
require'lspconfig'.html.setup{
	capabilites = capabilities,
}

--Emmet
	require'lspconfig'.emmet_ls.setup{}

-- CSS
	require'lspconfig'.cssls.setup{
		capabilities = capabilities
	}

-- ESlint
	require'lspconfig'.eslint.setup{}

-- C#
	require'lspconfig'.csharp_ls.setup{}

-- Markdown
	require'lspconfig'.marksman.setup{}

-- Lua
	require'lspconfig'.luau_lsp.setup{}
