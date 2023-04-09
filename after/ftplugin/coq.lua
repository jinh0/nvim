vim.keymap.set("n", "J", ":CoqNext<CR>", { silent = true, buffer = true })
vim.keymap.set("n", "K", ":CoqUndo<CR>", { silent = true, buffer = true })
vim.keymap.set("n", "<A-f>", ":CoqToLine<CR>", { silent = true, buffer = true })
