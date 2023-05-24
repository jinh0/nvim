return {
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
    dependencies = 'nvim-tree/nvim-web-devicons',
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
}
