return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			-- vim.cmd([[ Neotree show filesystem ]])
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree<CR>")

			require("neo-tree").setup({
				filesystem = {
					window = {
						mappings = {
							["o"] = "toggle_node"
						}
					},
					filtered_items = {
						hide_gitignored = false
					}
				}
			})
		end
	},
}
