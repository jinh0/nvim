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
  use {
    "windwp/nvim-autopairs",
    config = function()
        require "config.plugins.autopairs"
    end
  }

  use 'preservim/nerdcommenter'

  -- Aesthetics
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' }

  use {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup { stages = "static" }
      vim.notify = require('notify')
    end
  }

  -- Fennel / Lisp Tools
  use 'Olical/conjure'

  use {
    'rktjmp/hotpot.nvim',
    config = function()
      require("hotpot").setup({
        enable_hotpot_diagnostics = true,
        compiler = {
          macros = {
            env = "_COMPILER",
            compilerEnv = _G,
            allowedGlobals = false,
          }
        }
      })
    end
  }

  use 'gpanders/nvim-parinfer'

  use 'dstein64/vim-startuptime'

  use {
    '~/dev/eyeliner.nvim',
    config = function()
      require'eyeliner'.setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
  }

  use 'kyazdani42/nvim-web-devicons'


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

  use "rafamadriz/friendly-snippets"

  use {
    'L3MON4D3/LuaSnip',
    config = function()
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

  use {
    'onsails/lspkind-nvim',
    event = 'InsertEnter',
    config = function()
      require('lspkind').init{}
    end
  }

  use 'jubnzv/virtual-types.nvim'

  use {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    after = 'nvim-lspconfig',
    config = function ()
      require 'symbols-outline'.setup()
    end
  }

  -- LaTeX
  use 'lervag/vimtex'

  -- HTML/JSX
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
  }

  -- UI Extensions
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
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    config = function()
      require'nvim-tree'.setup {
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true
            }
          },
          highlight_git = true
        }
      }
    end
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-_>]]
      }
    end
  }

  -- Colorschemes
  use 'folke/tokyonight.nvim'
end)
