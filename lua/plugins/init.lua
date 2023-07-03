return {
  'folke/tokyonight.nvim',
  'gpanders/nvim-parinfer',

  'jubnzv/virtual-types.nvim',

  'mattn/emmet-vim',

  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'gitsigns'.setup {}
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-nvim-lua'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  {
    'stevearc/oil.nvim',
    keys = {'-'},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup()
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
  },

  { "lukas-reineke/indent-blankline.nvim" },

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
  }
}
