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
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    keys = {"<leader>a", "<leader>A"},
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
  },
}
