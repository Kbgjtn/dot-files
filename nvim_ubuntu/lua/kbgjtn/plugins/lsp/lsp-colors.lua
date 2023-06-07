local colors_status, lsp_colors = pcall(require, "lsp-colors")
if not colors_status then
	return
end

lsp_colors.setup({
	Error = "#C1D0B5",
	Warning = "#C1D0B5",
	Information = "#C1D0B5",
	Hint = "#C1D0B5",
})
