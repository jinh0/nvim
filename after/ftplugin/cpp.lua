vim.keymap.set(
	{ "n" },
	"<C-'>",
	":silent !g++ % && cat input.txt | ./a.out > output.txt<CR>",
	{ noremap = true, silent = true }
)
