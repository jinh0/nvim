return {
  'mattn/emmet-vim',
  'gpanders/nvim-parinfer',

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('Comment').setup()
    end
  },

  {
    "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
  },
}
