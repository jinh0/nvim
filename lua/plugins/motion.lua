return {
  -- {
  --   'ggandor/leap.nvim',
  --   keys = {'s', 'S'},
  --   config = function ()
  --     require'leap'.setup {}
  --
  --     vim.keymap.set({'n'}, 's', '<Plug>(leap-forward-to)', { noremap = true, silent = true })
  --     vim.keymap.set({'n'}, 'S', '<Plug>(leap-backward-to)', { noremap = true, silent = true })
  --   end
  -- },

  {
    'jinh0/eyeliner.nvim',
    dev = true,
    config = function ()
      require'eyeliner'.setup {
        highlight_on_key = true,
        dim = true,
        match = '[A-Za-z0-9+-]'
      }
      vim.cmd([[
       hi! link EyelinerDimmed Comment
      ]])
    end
  }
}
