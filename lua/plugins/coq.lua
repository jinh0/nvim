return {
  'whonore/Coqtail',
  config = function ()
    vim.g.coqtail_nomap = 1

    -- vim.keymap.set('n', '<a-j>', ':CoqNext<cr>', {})
    -- vim.keymap.set('n', '<a-k>', ':CoqUndo<cr>', {})
    -- vim.keymap.set('n', '<a-l>', ':CoqToLine<cr>', {})
  end
}
