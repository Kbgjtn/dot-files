---@diagnostic disable-next-line: param-type-mismatch
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
local theme = require("gruvbox")

if not status then
	print("ColorScheme not found!") -- print error if colorscheme not installed
	return
end

theme.setup({
	undercurl = true,
	underline = false,
	bold = true,
	italic = {
		strings = false,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	invert_diff = false,
	inverse = false, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
		SignColumn = { bg = "#101010" },
		CursorLine = { bg = "#131515" },
		CursorLineNr = { fg = "#fdca40", bg = "" },
		Comment = { fg = "#efc88b" },
		Visual = { bg = "#191919" },
	},
	dim_inactive = false,
	transparent_mode = true,
})
