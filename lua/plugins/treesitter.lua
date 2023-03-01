return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = "BufReadPost",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "javascript", "graphql", "json", "c", "cpp", "lua", "typescript" },
        highlight = {
          enable = true
        },
      }

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.beluga = {
        install_info = {
          url = "~/dev/tree-sitter-beluga", -- local path or git repo
          files = {"src/parser.c"},
        },
        filetype = "bel", -- if filetype does not match the parser name
      }

      local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
      ft_to_parser.bel = "beluga"

    end
  },

  {
    'nvim-treesitter/playground',
    cmd = {'TSHighlightCapturesUnderCursor', 'TSPlaygroundToggle'}
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function()
      require'nvim-treesitter.configs'.setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>"
          }
        },
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
  },
}
