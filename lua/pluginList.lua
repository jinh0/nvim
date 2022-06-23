local opts = require('config')

-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TREESITTER {{{
  use {
    'nvim-treesitter/nvim-treesitter',
    event = {"BufRead", "BufNewFile"},
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end
  }

  use {
    'nvim-treesitter/playground',
    event = 'BufRead'
  }

  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- }}}
  -- LSP {{{
  use 'jubnzv/virtual-types.nvim'


  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      config = function()
          require("nvim-lsp-installer").setup {}
          require 'plugins.lsp-config'
      end,
      requires = {
        {
          'nvim-lua/lsp-status.nvim'
        }
      }
      -- requires = {
        -- {
          -- 'glepnir/lspsaga.nvim',
          -- config = function()
            -- require 'plugins.lspsaga'
          -- end
        -- }
      -- }
    }
  }

  use 'APZelos/blamer.nvim'

  use 'ggandor/lightspeed.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use {
    "hrsh7th/nvim-cmp",
    config = function()
        require "plugins.cmp"
    end,
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"



  -- use {
    -- "hrsh7th/nvim-compe",
    -- event = "InsertEnter",
    -- config = function()
        -- require "plugins.compe"
    -- end,
  -- }

  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  }

  use {
    "windwp/nvim-autopairs",
    -- after = "nvim-compe",
    config = function()
        require "plugins.autopairs"
    end
  }

  use {
    'onsails/lspkind-nvim',
    event = 'InsertEnter',
    config = function()
      require('lspkind').init{}
    end
  }

  use 'lervag/vimtex'

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "lsp_signature".setup()
    end
  }

  use {
    'simrat39/symbols-outline.nvim',
    after = 'nvim-lspconfig',
    setup = function()
      require 'mappings'.symbols_outline()
    end
  }

  use 'HerringtonDarkholme/yats.vim'

  -- Telescope {{{
  use "nvim-lua/plenary.nvim"
  use {
      "nvim-lua/popup.nvim",
      after = "plenary.nvim"
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = {'Telescope', 'TelescopeBuffers', 'TelescopeDotfiles'},
    config = function()
      require 'plugins.telescope'
    end,
    setup = function()
      require 'mappings'.telescope()
    end
  }
  -- }}}

  use {
    'preservim/nerdcommenter',
    disable = false
  }

  -- use {
    -- '~/dev/eyeliner.nvim',
    -- disable = false,
    -- config = function()
      -- require('eyeliner').setup{}
    -- end
  -- }

  use {
    'David-Kunz/treesitter-unit',
    disable = false,
    event = 'BufRead',
    setup = function()
      require 'mappings'.tsunit()
    end
  }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.barbar')
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require 'plugins.lualine'
    end,
    requires = 'arkav/lualine-lsp-progress'
  }

  use 'nvim-lua/lsp-status.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    config = function()
      require 'plugins.nvimtree'
      require'nvim-tree'.setup {}
    end
  }

  -- use {
    -- 'airblade/vim-gitgutter',
    -- event = 'BufRead'
  -- }

  use 'tpope/vim-surround'

  use {
    'AndrewRadev/tagalong.vim',
    disable = opts.tagalong
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    disable = false
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  }

  -- colorschemes
  use {
    'pineapplegiant/spaceduck',
    branch = 'dev'
  }
  use 'sainnhe/gruvbox-material'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'arcticicestudio/nord-vim'
  use 'Mofiqul/vscode.nvim'
  use 'sainnhe/everforest'

  use 'mattn/emmet-vim'

end)

-- packer.init {
  -- luarocks = {
    -- python_cmd = 'python3'
  -- }
-- }

