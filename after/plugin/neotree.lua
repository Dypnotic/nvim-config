
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- vim.cmd([[ Neotree show filesystem ]])

vim.keymap.set("n", "<leader>e", "<cmd>Neotree<CR>", opts)

require("neo-tree").setup ({
	filesystem = {
		window = {
			mappings = {
				["o"] = "toggle_node"
			}
		},
		filtered_items = {
			hide_gitignored = true
		}
	}
})
