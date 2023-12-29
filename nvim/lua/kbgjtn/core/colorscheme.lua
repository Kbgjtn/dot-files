local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
local theme = require("kanagawa")
local colors = require("kbgjtn.utils.color")

if not status then
	print("colorscheme not found!")
	return
end

theme.load("dragon")
theme.setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = false },
	functionStyle = { bold = true, italic = false },
	keywordStyle = { italic = false, bold = true },
	statementStyle = { bold = true, italic = false },
	typeStyle = { bold = true, italic = false },
	transparent = false,
	dimInactive = false,
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus",
	},
	enableTreesitter = true,
	terminalColors = true,
	colors = {
		theme = {
			all = {
				ui = {
					fg = colors.dark.other,
					fg_dim = colors.yellow.sunglow_dim,
					fg_reverse = colors.orange.beer,
					special = colors.red.cg,
					bg = colors.dark.chinese,
					bg_search = colors.dark.liver,
					bg_visual = colors.dark.raisin,
				},
				syn = {
					markup = colors.yellow.sunglow,
					string = colors.dark.other,
					variable = colors.red.cg,
					number = colors.grey.argent,
					constant = colors.grey.tones,
					operator = colors.grey.tints,
					parameter = colors.orange.chinese,
					identifier = "#606060",
					statement = colors.yellow.sunglow_dim,
					keyword = colors.red.cg,
					comment = colors.grey.tones,
					fun = colors.grey.tints,
					type = colors.yellow.sunglow,
					punct = colors.dark.liver,
					preproc = colors.yellow.sunglow,
					special1 = colors.yellow.sunglow,
					special2 = colors.green.pear,
					special3 = colors.dark.other,
				},
				diag = {
					ok = colors.grey.tints,
					error = colors.red.cg,
					warning = colors.orange.chinese,
					info = colors.grey.tints,
					hint = colors.grey.tints,
				},
				pmenu = {
					fg = colors.yellow.sunglow,
					fg_sel = colors.yellow.sunglow,
					bg = colors.dark.chinese,
					bg_sel = colors.dark.chinese,
					bg_sbar = colors.dark.chinese,
					bg_thumb = colors.dark.chinese,
				},
				float = {
					fg = colors.yellow.sunglow,
					bg = colors.dark.chinese,
					fg_border = colors.yellow.sunglow,
					bg_border = colors.dark.chinese,
				},
			},
		},
	},
	overrides = function()
		return {
			CursorLine = { bg = colors.dark.eerie, fg = colors.none },
			CursorLineNr = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },
			SignColumn = { bg = colors.dark.chinese, fg = colors.none },
			SignalColumn = { bg = colors.dark.chinese, fg = colors.none },
			Cursor = { bg = colors.dark.other, fg = colors.red.cg },
			LineNr = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			CopilotSuggestion = { bg = colors.none },
			Visual = { bg = colors.dark.raisin, fg = colors.none },
			VisualNOS = { bg = colors.dark.raisin },
			Search = { bg = colors.dark.raisin },
			IncSearch = { bg = colors.dark.raisin },
			HlSearch = { bg = colors.dark.raisin },

			Highlight = { bg = colors.dark.raisin },
			MatchParen = { bg = colors.dark.raisin },

			-- ufo fold
			Folded = { bg = colors.none, fg = colors.grey.tints },
			FoldColumn = { bg = colors.none, fg = colors.dark.liver },

			-- cmp lua
			CmpNormal = { bg = colors.none, fg = colors.yellow.sunglow_dim },
			CmpDocNormal = { bg = colors.none },
			CmpItemAbbrMatch = { bg = colors.none },
			CmpItemAbbrMatchFuzzy = { bg = colors.none },
			CmpPopupNormal = { bg = colors.none },
			CmpPopupNormalSelected = { bg = colors.none },
			CmpItemMenu = { bg = colors.none, fg = colors.yellow.sunglow_dim },

			-- marks
			MarkSignHL = { bg = colors.dark.chinese, fg = colors.orange.chinese },
			MarkSignNum = { bg = colors.dark.chinese, fg = colors.orange.chinese },
			MarkSignNumHL = { bg = colors.dark.eerie, fg = colors.orange.chinese },

			-- Oil nvim
		}
	end,
})
