return {
	"jubnzv/virtual-types.nvim",

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},

	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
}
