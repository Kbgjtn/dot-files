vim.api.nvim_create_autocmd("BufEnter", {
	command = "colorscheme kanagawa",
})

--[[ local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {}) ]]
--[[ vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local status, go = pcall(require, "go")
		if status then
			go.gofmt()
		end
		go.format.goimport()
	end,
	group = format_sync_grp,
}) ]]

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
