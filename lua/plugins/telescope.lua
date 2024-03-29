return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-project.nvim' },  -- Telescope Projects
			{ 'nvim-telescope/telescope-file-browser.nvim' } -- Telescope File Browser
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
			vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
			vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})

			vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
			vim.keymap.set('n', '<leader>fgh', builtin.git_bcommits, {})
			vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
			vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})

			vim.keymap.set('n', '<leader>fs', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
			end)

			local project_actions = require("telescope._extensions.project.actions")
			require('telescope').setup {
				defaults = {
					file_ignore_patterns = {
						".*%.jpg",
						".*%.jpeg",
						".*%.png",
						".*%.gif",
						".*%.tif",
						".*%.tiff",
						".*%.png",
					}
				},
				extensions = {
					project = {
						-- hidden_files = true, -- default: false
						-- order_by = "asc",
						-- search_by = "title",
						theme = "dropdown",
						sync_with_nvim_tree = true, -- default false
						-- default for on_project_selected = find project files
						on_project_selected = function(prompt_bufnr)
							-- Do anything you want in here.
							project_actions.change_working_directory(prompt_bufnr, false)
						end
					}
				}
			}

			local project = require 'telescope'.load_extension('project')
		  vim.keymap.set('n', '<leader>fp', project.project, {})
		end
	},
}
