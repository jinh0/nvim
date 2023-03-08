local function _1_()
  return vim.cmd("silent !make")
end
vim.api.nvim_create_autocmd("BufWritePost", {callback = _1_, pattern = "*.fnl"})
local function _2_()
  vim.opt["textwidth"] = 80
  return nil
end
vim.api.nvim_create_autocmd("FileType", {callback = _2_, pattern = "*.tex"})
local function _3_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 300, on_visual = true})
end
return vim.api.nvim_create_autocmd("TextYankPost", {callback = _3_, pattern = "*"})
