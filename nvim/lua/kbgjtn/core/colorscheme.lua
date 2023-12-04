---@diagnostic disable-next-line: param-type-mismatch
local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
local theme = require("kanagawa")

if not status then
	print("colorscheme not found!")
	return
end

theme.load("dragon")
theme.setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = false },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = {
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function()
		return {
			CursorLine = { bg = "#1c1c1c" },
			CursorLineNr = { bg = "#1c1c1c" },
			SignColumn = { bg = "#1c1c1c" },
			SingnalColumn = { bg = "#1c1c1c" },
			Cursor = { bg = "#4F4A45" },
			LineNr = { bg = "#1c1c1c" },
			CopilotSuggestion = { bg = "" },
			Visual = { bg = "#252525" },
			VisualNOS = { bg = "#252525" },
			Search = { bg = "#252525", fg = "" },
			IncSearch = { bg = "#252525", fg = "" },
			HlSearch = { bg = "#252525", fg = "" },
			Highlight = { bg = "#252525", fg = "" },
			MatchParen = { bg = "#252525", fg = "" },

			BufferLineBackground = { bg = "NONE" },
			BufferLineFill = { bg = "NONE" },
			BufferLineSeparator = { bg = "NONE" },
			BufferLineIndicatorSelected = { bg = "#1c1c1c" },
			BufferLineIndicator = { bg = "#FFC436" },
			BufferLineTabSelected = { bg = "#1c1c1c" },
			BufferLineTab = { bg = "#1c1c1c", fg = "#DED0B6" },
		}
	end,
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
	enableTreesitter = true,
})
