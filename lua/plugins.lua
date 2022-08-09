vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require'packer'.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Make Neovim faster
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'

  -- Nice-to-haves
  use 'preservim/nerdcommenter'

  use {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup { timeout = 50 }
      vim.notify = require('notify')
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
        require "plugins.autopairs"
    end
  }

  use {
    '~/dev/eyeliner.nvim',
    config = function()
      require'eyeliner'.setup { highlight_on_key = true }
    end
  }

  use 'kyazdani42/nvim-web-devicons'

  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'plugins.treesitter'
    end
  }

  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require'hlargs'.setup{
        color = '#ECEFF4'
      }
    end
  }

  use {
    'nvim-treesitter/playground',
    event = 'BufRead'
  }


  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require'gitsigns'.setup()
    end
  }

  use 'APZelos/blamer.nvim'

  -- Autocomplete
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

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      config = function()
          require 'nvim-lsp-installer'.setup {}
          require 'plugins.lsp-config'
      end,
      requires = 'nvim-lua/lsp-status.nvim'
    }
  }

  use 'nvim-lua/lsp-status.nvim'
  use 'jubnzv/virtual-types.nvim'
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

  use {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    after = 'nvim-lspconfig',
    setup = function()
      require 'mappings'.symbols_outline()
    end
  }


  -- use 'ggandor/lightspeed.nvim'
  --
  -- use {'unblevable/quick-scope',
    -- config = function()
      -- vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    -- end,
  -- }

  -- File-dependent nice-to-haves
  use 'lervag/vimtex'
  use 'gpanders/nvim-parinfer'
  use 'AndrewRadev/tagalong.vim'
  use 'mattn/emmet-vim'

  -- Telescope
  use "nvim-lua/plenary.nvim"
  use { "nvim-lua/popup.nvim", after = "plenary.nvim" }

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

  -- UI
  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.barbar')
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = 'arkav/lualine-lsp-progress',
    config = function()
      require 'plugins.lualine'
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    config = function()
      require'nvim-tree'.setup {
        renderer = {
          icons = {
            show = { file = true, folder = true, folder_arrow = true }
          },
          highlight_git = true
        }
      }
    end
  }

  use 'akinsho/nvim-toggleterm.lua'

  -- Colorschemes
  use { 'pineapplegiant/spaceduck', branch = 'dev' }
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'
  use 'Mofiqul/vscode.nvim'
  use 'B4mbus/oxocarbon-lua.nvim'
end)
