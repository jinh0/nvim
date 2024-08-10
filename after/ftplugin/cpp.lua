vim.keymap.set(
	{ "n" },
	"<C-s>",
  function ()
    local file = vim.fn.bufname("%")
    vim.cmd("silent !g++ " .. file)
    vim.cmd("silent !cat input.txt | ./a.out &> output.txt")
  end,
	{ noremap = true, silent = true }
)
