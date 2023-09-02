return {
  'whonore/Coqtail',
  config = function ()
    vim.g.coqtail_nomap = 1

    vim.keymap.set('n', 'J', ':CoqNext<cr>', {})
    vim.keymap.set('n', 'K', ':CoqUndo<cr>', {})
    vim.keymap.set('n', '<a-l>', ':CoqToLine<cr>', {})
  end
}
