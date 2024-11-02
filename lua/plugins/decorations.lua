return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- require("ibl").setup({
			-- 	scope = {
			-- 		enabled = true,
			-- 		show_start = false,
			-- 		show_end = false,
			-- 	},
			-- })
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
}
