-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", function() api.tree.focus() end, opts)

-- empty setup using defaults
require("nvim-tree").setup({
	view = {
		width = 50,
		mappings = {
			list = {
				{ key = "u", action = "dir_up"},
				{ key = "n", action = "dir_down"}
			}
		}
	}
})

-- OR setup with some options
-- require("nvim-tree").setup({
--   sort_by = "case_sensitive",
--   view = {
--     width = 30,
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--       },
--     },
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })