return {
  --{
  --  "rktjmp/hotpot.nvim",
  --  priority = 1000,
  --  config = function()
  --    require "hotpot"
  --  end
  --},

  {
    'whonore/Coqtail',
    config = function ()
      vim.cmd [[
        hi! link CoqtailChecked Visual
        hi! link Todo CursorLine
      ]]
    end
  },

  {
    'ethanholz/nvim-lastplace',
    config = function()
      require'nvim-lastplace'.setup{}
    end
  },

  -- Make Neovim faster
  'nathom/filetype.nvim',
  'lewis6991/impatient.nvim',

  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },

  -- Aesthetics
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup { stages = "static", timeout = 1000 }
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
      require'gitsigns'.setup({
        current_line_blame = false,
      })
    end
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load({ path = { "/Users/jinhoyoon/.config/nvim/snippets" } })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
      require 'lsp.lsp-config'
      require("mason").setup()
      require "mason-lspconfig".setup()
    end
  },

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
  {
    'AndrewRadev/tagalong.vim',
    ft = {"html", "javascriptreact", "typescriptreact"}
  },

  {
    'mattn/emmet-vim',
    keys = ",,",
    ft = {"html", "javascriptreact", "typescriptreact"}
  },

  -- Telescope
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-lua/popup.nvim", lazy = true },

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
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
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

  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup({
        hlgroup = 'CursorLine',
        cw_hlgroup = 'Visual'
      })
    end
  },

  {
    'github/copilot.vim',
    init = function ()
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
  },

  {
    'stevearc/oil.nvim',
    config = function ()
      require('oil').setup()
    end
  },

  {
    "SmiteshP/nvim-navic",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function ()
      require('nvim-navic').setup {
        highlight = true
      }

      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  },

  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    },
    config = function ()
      vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end
  }
}
