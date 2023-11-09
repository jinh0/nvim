return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "dist", "node_modules", "build" },
					prompt_title = false,
					mappings = {
						i = {
							["<cr>"] = actions.select_default + actions.center,
							["<esc>"] = actions.close,
							["<C-p>"] = actions.close,
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						sort_lastused = true,
					},
				},
			})
		end,
	},
}
