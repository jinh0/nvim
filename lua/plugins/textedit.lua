return {
	"mattn/emmet-vim",
	{
		"gpanders/nvim-parinfer",
		config = function()
			vim.g.parinfer_filetypes = { "lispy", "scheme" }
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			local add_rule = function(x, y, z)
				autopairs.add_rule(Rule(x, y, z))
			end

			autopairs.setup({})

			add_rule("$", "$", "tex")
			add_rule("$$", "$$", "tex")
			add_rule("\\{", "\\}", "tex")
			add_rule("\\[", "\\]", "tex")
			add_rule('"""', '"""', "python")
			add_rule("'''", "'''", "python")
		end,
	},
}
