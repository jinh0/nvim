return {
	"jubnzv/virtual-types.nvim",

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},
}
