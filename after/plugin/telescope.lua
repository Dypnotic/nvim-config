local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local project_actions = require("telescope._extensions.project.actions")
require('telescope').setup {
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
