local status, lf = pcall(require, "lf")

if not status then
	return
end

lf.setup({
	escape_quit = false,
	border = "rounded",
	highlights = { NormalFloat = { guibg = "NONE" } },
	winblend = 0,
})
