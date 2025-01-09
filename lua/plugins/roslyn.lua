return {
	"seblj/roslyn.nvim",
	ft = "cs",
	config = function()
		require('roslyn').setup {
			args = {
				'--logLevel=Information',
				'--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
				'--razorSourceGenerator=' .. vim.fs.joinpath(
					vim.fn.stdpath 'data'--[[@as string]] ,
					'mason',
					'packages',
					'roslyn',
					'libexec',
					'Microsoft.CodeAnalysis.Razor.Compiler.dll'
				),
				'--razorDesignTimePath=' .. vim.fs.joinpath(
					vim.fn.stdpath 'data'--[[@as string]] ,
					'mason',
					'packages',
					'rzls',
					'libexec',
					'Targets',
					'Microsoft.NET.Sdk.Razor.DesignTime.targets'
				),
			},
		}
	end
}
