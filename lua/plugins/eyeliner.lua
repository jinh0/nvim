return {
	{
		"jinh0/eyeliner.nvim",
		dev = true,
		-- event = "BufReadPre",
    -- keys = { 'f' },
		config = function()
			require("eyeliner").setup({
				highlight_on_key = {"f", "F", "t", "T"},
				dim = true,
        default_keymaps = true,
				match = "[A-Za-z0-9+-]",
        disabled_filetypes = {},
        disabled_buftypes = {"nofile"}
			})

      -- local function eyeliner_move(key, forward)
      --   return function()
      --     require('eyeliner').highlight({ forward = forward })
      --     return key
      --   end
      -- end
      --
      -- vim.keymap.set('n', 'f', eyeliner_move('f', true))
      -- vim.keymap.set('n', 'F', eyeliner_move('F', false))
      -- vim.keymap.set('n', 't', eyeliner_move('t', true))
      -- vim.keymap.set('n', 'T', eyeliner_move('T', false))
			--
			-- vim.cmd([[
   --     hi! link EyelinerDimmed Comment
   --    ]])
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
