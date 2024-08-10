vim.keymap.set(
	{ "n" },
	"<C-s>",
  function ()
    local file = vim.fn.bufname("%")
    vim.cmd("silent !cat input.txt | python3 " .. file .. " &> output.txt")
  end,
	{ noremap = true, silent = true }
)

--[[
command Run ! cat input.txt | python3 main.py &> output.txt
nnoremap <silent> <C-'> :silent Run<CR>
]]--
