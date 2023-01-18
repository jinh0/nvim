return {
  {
    "rktjmp/hotpot.nvim",
    priority = 1000,
    config = function()
      require"hotpot"
    end
  },

  -- Make Neovim faster
  'nathom/filetype.nvim',
  'lewis6991/impatient.nvim',

  -- Nice-to-haves
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require "config.plugins.autopairs"
    end
  },

  {
    'preservim/nerdcommenter',
    keys = "++"
  },

  -- Aesthetics
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup { stages = "static" }
      vim.notify = require('notify')
    end
  },

  {
    'dstein64/vim-startuptime',
    cmd = "StartupTime"
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre",
    config = function()
      require'gitsigns'.setup()
    end
  },

  'APZelos/blamer.nvim',

  "rafamadriz/friendly-snippets",

  {
    'L3MON4D3/LuaSnip',
    event = "InsertEnter",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load({ path = { "/Users/jinhoyoon/.config/nvim/snippets" } })
    end
  },

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  {
    'onsails/lspkind-nvim',
    event = 'InsertEnter',
    config = function()
      require('lspkind').init{}
    end
  },

  {
    'jubnzv/virtual-types.nvim',
    ft = "ocaml"
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    config = function ()
      require 'symbols-outline'.setup()
    end
  },

  -- LaTeX
  {
    'lervag/vimtex',
    ft = {"tex"}
  },

  -- HTML/JSX
  'AndrewRadev/tagalong.vim',

  {
    'mattn/emmet-vim',
    keys = ",,",
    ft = {"html", "javascriptreact", "typescriptreact"}
  },

  -- Telescope
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },

  {
    "nvim-lua/popup.nvim",
    lazy = true
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = {'Telescope', 'TelescopeBuffers', 'TelescopeDotfiles'},
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {'dist', 'node_modules', 'build'},
          prompt_title = false,
          mappings = {
            i = {
              ['<cr>'] = actions.select_default + actions.center,
              ['<esc>'] = actions.close,
              ['<C-p>'] = actions.close,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
            }
          },
        },
        pickers = {
          find_files = {
            theme = 'dropdown',
            previewer = false,
            sort_lastused = true
          }
        }
      }
    end,
  },

  -- UI Extensions
  {
    'romgrk/barbar.nvim',
    config = function()
      vim.g.bufferline = {
        animation = false,
        icon_separator_active = '',
        icon_separator_inactive = '',
        icons = true
      }
    end
  },

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
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
  },

  {
    'akinsho/nvim-toggleterm.lua',
    key = {"<C-_>"},
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-_>]]
      }
    end
  },

  -- Colorschemes
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },
}
