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
			vim.keymap.set('n', '<leader>fm', builtin.marks, {})
			vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
			vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
			vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, {})
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
					},
					file_browser = {
						-- theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							["i"] = {
								-- your custom insert mode mappings
							},
							["n"] = {
								-- your custom normal mode mappings
							},
						},
					}
				}
			}

			local project = require 'telescope'.load_extension('project')
			local file_browser = require 'telescope'.load_extension('file_browser')
			local noice = require 'telescope'.load_extension('noice')
			vim.keymap.set('n', '<leader>fp', project.project, {})
			vim.keymap.set('n', '<leader>fe', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
			vim.keymap.set('n', '<leader>fn', noice.noice, {})
		end
	},
}
