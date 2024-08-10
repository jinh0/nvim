return {
	{
		"jinh0/eyeliner.nvim",
		dev = true,
		event = "BufReadPre",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
        default_keymaps = true,
				match = "[A-Za-z0-9+-]",
        disabled_filetypes = {},
        disabled_buftypes = {"nofile"}
			})

			vim.cmd([[
       hi! link EyelinerDimmed Comment
      ]])
		end,
	},

  -- {
  --   "rhysd/clever-f.vim",
  --   dependencies = {"eyeliner.nvim"},
  --   init = function()
  --     vim.g.clever_f_not_overwrites_standard_mappings = 1
  --
  --     vim.keymap.set(
  --       {"n", "x", "o"},
  --       "f",
  --       function() 
  --         require("eyeliner").highlight({ forward = true })
  --         return "f"
  --       end,
  --       {expr = true}
  --     )
  --   end
  -- }
}
