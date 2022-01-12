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
    }
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      previewer = false,
      sort_lastused = true
    }
  }
}

local M = {}
M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = '< VIM config >',
    cwd = '/Users/jinhoyoon/.config/nvim/',
    -- mappings = {
      -- i = {
        -- ['<cr>'] = actions.select_default + actions.center,
        -- ['<esc>'] = actions.close
      -- }
    -- }
  })
end

M.search_plugins = function()
  require('telescope.builtin').file_browser({
    prompt_title = '< Plugins >',
    cwd = '/Users/jinhoyoon/.local/share/nvim/site/pack/packer/start',
    mappings = {
      i = {
        ['<cr>'] = actions.select_default + actions.center
      }
    }
  })
end

require('telescope').load_extension('coc')
require('telescope').load_extension('neoclip')

-- M.spaceduck_colors = function()
  -- pickers.new {
    -- prompt_title = '< SPACEDUCK >',
    -- finder = finders.new_table({ 'SpaceduckRed', 'SpaceduckOrange', 'SpaceduckGreen', 'SpaceduckYellow', 'SpaceduckPurple', 'SpaceduckPurple2', 'SpaceduckDarkPurple', 'SpaceduckDarkPurple2'}),
    -- sorter = sorters.get_fzy_sorter()
  -- }:find()
-- end

return M
