return {
  'lukas-reineke/indent-blankline.nvim',

  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'gitsigns'.setup {}
    end
  },
}
