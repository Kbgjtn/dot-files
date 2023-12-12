local status, golang = pcall(require, "go")

if not status then
	return
end

golang.setup()

require("go.format").gofmt() -- gofmt only
require("go.format").goimport() -- goimport + gofmt

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").gofmt()
	end,
	group = format_sync_grp,
})
