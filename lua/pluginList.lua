local opts = require('config')

-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TREESITTER {{{
  use {
    'nvim-treesitter/nvim-treesitter',
    disable = opts.treesitter,
    event = "BufRead",
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end
  }

  use {
    'nvim-treesitter/playground',
    disable = opts.ts_playground,
    event = 'BufRead'
  }
  -- }}}

  -- LSP {{{
  use 'kabouzeid/nvim-lspinstall'

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.lsp-config'
    end,
    requires = {
      {
        'glepnir/lspsaga.nvim',
        config = function()
          require 'plugins.lspsaga'
        end
      }
    }
  }

  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
        require "plugins.compe"
    end,
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-compe",
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

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "lsp_signature".setup()
    end
  }

  -- use {
    -- 'glepnir/lspsaga.nvim',
    -- after = 'nvim-lspconfig',
    -- config = function()
      -- require
    -- end
  -- }

  use {
    'simrat39/symbols-outline.nvim',
    after = 'nvim-lspconfig',
    setup = function()
      require 'mappings'.symbols_outline()
    end
  }

  -- use {
    -- 'neoclide/coc.nvim',
    -- disable = false,
    -- branch = 'release',
    -- event = {'CursorHold', 'BufRead'}
  -- }
  -- }}}

  use 'HerringtonDarkholme/yats.vim'

  -- Telescope {{{
  use "nvim-lua/plenary.nvim"
  use {
      "nvim-lua/popup.nvim",
      after = "plenary.nvim"
  }

  use 'fannheyward/telescope-coc.nvim'
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

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {'tami5/sqlite.lua', module = 'sqlite'},
    config = function()
      require('neoclip').setup({
        history = 100,
        enable_persistant_history = true,
      })
    end,
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

  -- use {
  --   'JoosepAlviste/nvim-ts-context-commentstring',
  --   event = 'BufRead'
  -- }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.barbar')
    end
  }

  -- use {
    -- 'romgrk/barbar.nvim',
    -- config = function()
      -- require('plugins.barbar')
    -- end,
    -- setup = function()
      -- require 'mappings'.barbar()
    -- end
  -- }

  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require 'plugins.lualine'
    end
  }

  use 'nvim-lua/lsp-status.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    config = function()
      require 'plugins.nvimtree'
    end
  }

  use {
    'airblade/vim-gitgutter',
    event = 'BufRead'
  }

  -- use 'kshenoy/vim-signature'
  use 'tpope/vim-surround'
  use 'mattn/emmet-vim'
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
    disable = opts.indent_blankline,
    event = 'BufRead'
  }

  -- colorschemes
  use 'pineapplegiant/spaceduck'
  use 'sainnhe/gruvbox-material'
  use 'ray-x/aurora'
  -- use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'mcchrish/zenbones.nvim'
  use 'arcticicestudio/nord-vim'

  use 'sainnhe/everforest'

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          -- Options (see available options below)
          vim.g.rose_pine_variant = 'dawn'

          -- Load colorscheme after options
          -- vim.cmd('colorscheme rose-pine')
      end
  })


end)

-- packer.init {
  -- luarocks = {
    -- python_cmd = 'python3'
  -- }
-- }

