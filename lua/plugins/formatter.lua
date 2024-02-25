return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					ocaml = { "ocamlformat" },
					haskell = { "fourmolu" },
					typescriptreact = { "prettierd" },
					javascriptreact = { "prettierd" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					python = { "black" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = false,
				},
			})
		end,
	},
}
