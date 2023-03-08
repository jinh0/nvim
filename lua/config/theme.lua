local hl_21
local function _1_(...)
  return vim.api.nvim_set_hl(0, ...)
end
hl_21 = _1_
vim.cmd.colorscheme("tokyonight")
return hl_21("@punctuation.bracket", {link = "Comment"})
