vim.keymap.set({ "n" }, "<space>s", function()
	if vim.diagnostic.is_disabled() then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, { noremap = true, silent = true })

vim.keymap.set({ "t" }, "<esc>", "<c-\\><c-n>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<c-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set({ "v" }, "<a-c>", '"+y', { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<", "<<", { noremap = true, silent = true })
vim.keymap.set({ "n" }, ">", ">>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<c-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-g>", ":Telescope lsp_workspace_symbols<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "gr", ":Telescope lsp_references<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>gg", ":Telescope live_grep<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "++", "<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
vim.keymap.set({ "v" }, "++", "<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<A-1>", ":BufferGoto 1<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-2>", ":BufferGoto 2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-3>", ":BufferGoto 3<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-4>", ":BufferGoto 4<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-5>", ":BufferGoto 5<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-6>", ":BufferGoto 6<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-7>", ":BufferGoto 7<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-8>", ":BufferGoto 8<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-9>", ":BufferGoto 9<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-0>", ":BufferLast<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-,>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "H", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-.>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "L", ":BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-<>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-H>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A->>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-L>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-w>", ":BufferClose<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-q>", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<A-s>", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<space><space>", "za", { noremap = true, silent = true })
