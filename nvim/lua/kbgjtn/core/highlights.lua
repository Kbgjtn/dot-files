-- highlight yanked text for 200ms using the "Visual" highlight group

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({ higroup="Visual", timeout=100 })
  augroup END
]])
