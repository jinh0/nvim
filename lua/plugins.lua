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

  use 'rktjmp/hotpot.nvim'

  -- Make Neovim faster
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'

  -- Nice-to-haves
  use 'preservim/nerdcommenter'

  use {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup { timeout = 50, stages = "static" }
      vim.notify = require('notify')
    end
  }

  use 'Olical/aniseed'
  use 'Olical/conjure'

  use {
    "windwp/nvim-autopairs",
    config = function()
        require "plugins.autopairs"
    end
  }

  use {
    'jinh0/eyeliner.nvim',
    config = function()
      require"eyeliner".setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
    keys = {"f", "F", "t", "T"}
  }

  use 'dstein64/vim-startuptime'

  -- use {
    -- '~/dev/eyeliner.nvim',
    -- config = function()
      -- require'eyeliner'.setup {
        -- highlight_on_key = true,
        -- dim = true,
      -- }
    -- end,
    -- keys = {"f", "F", "t", "T"}
  -- }

  use "rafamadriz/friendly-snippets"

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
    'nvim-treesitter/playground',
    event = {'BufRead', 'BufNew', 'BufNewFile'}
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      }
    end
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
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
  use 'PaterJason/cmp-conjure'

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({ path = { "/Users/jinhoyoon/.config/nvim/snippets" } })
    end
  }
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }

  use 'jubnzv/virtual-types.nvim'
  use {
    'onsails/lspkind-nvim',
    event = 'InsertEnter',
    config = function()
      require('lspkind').init{}
    end
  }

  -- use {
    -- 'simrat39/symbols-outline.nvim',
    -- cmd = 'SymbolsOutline',
    -- after = 'nvim-lspconfig',
    -- setup = function()
      -- require("symbols-outline").setup( { width = 25 })
      -- require 'mappings'.symbols_outline()
    -- end
  -- }


  -- use 'ggandor/lightspeed.nvim'

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
  use 'folke/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'
  use 'Mofiqul/vscode.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
end)
