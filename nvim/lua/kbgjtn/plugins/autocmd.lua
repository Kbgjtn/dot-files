vim.api.nvim_create_autocmd("BufEnter", {
	command = "colorscheme kanagawa",
})

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
