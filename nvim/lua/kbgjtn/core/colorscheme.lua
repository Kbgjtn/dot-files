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
					bg = colors.dark.eerie,
					bg_search = colors.dark.raisin,
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
					comment = colors.dark.liver,
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
					bg = colors.dark.eerie,
					bg_sel = colors.dark.eerie,
					bg_sbar = colors.dark.eerie,
					bg_thumb = colors.dark.eerie,
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
			CursorLine = { bg = colors.dark.raisin, fg = colors.none },
			CursorLineNr = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },
			SignColumn = { bg = colors.dark.eerie, fg = colors.dark.eerie },
			SignalColumn = { bg = colors.dark.eerie, fg = colors.none },
			Cursor = { bg = colors.dark.liver, fg = colors.none },
			LineNr = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			CopilotSuggestion = { bg = colors.none },
			Visual = { bg = colors.dark.raisin, fg = colors.none },
			VisualNOS = { bg = colors.dark.raisin },
			Search = { bg = colors.none, fg = colors.orange.chinese },
			IncSearch = { bg = colors.dark.raisin, fg = colors.yellow.sunglow },
			HlSearch = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },

			Highlight = { bg = colors.dark.eerie, fg = colors.green.pear },
			MatchParent = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },

			-- ufo fold
			Folded = { bg = colors.none, fg = colors.grey.tints },
			FoldColumn = { bg = colors.none, fg = colors.dark.liver },

			-- cmp lua
			CmpNormal = { bg = colors.none, fg = colors.dark.liver },
			CmpItemAbbr = { bg = colors.none, fg = colors.dark.other },
			CmpDocNormal = { bg = colors.none, fg = colors.grey.argent },
			CmpItemAbbrMatch = { bg = colors.none, fg = colors.yellow.sunglow_dim },
			CmpItemAbbrMatchFuzzy = { bg = colors.none, fg = colors.yellow.sunglow_dim },
			CmpPopupNormal = { bg = colors.none },
			CmpPopupNormalSelected = { bg = colors.none },
			CmpItemMenu = { bg = colors.none, fg = colors.yellow.sunglow_dim },
			CmpItemKind = { bg = colors.none, fg = colors.orange.chinese },
			CmpItemKindFunction = { fg = colors.red.cg },
			CmpItemKindVariable = { fg = colors.grey.tints },

			-- marks
			MarkSignHL = { bg = colors.dark.eerie, fg = colors.orange.chinese },
			MarkSignNum = { bg = colors.dark.eerie, fg = colors.orange.chinese },
			MarkSignNumHL = { bg = colors.dark.eerie, fg = colors.orange.chinese },
			-- Oil nvim

			-- LspSaga
			HoverNormal = { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim },
			HoverBorder = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaNormal = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaBorder = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaTitle = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaToggle = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaCount = { bg = colors.dark.eerie, fg = colors.dark.other },
			SagaBeacon = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaSelect = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			SagaFinderFname = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			ActionFix = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			ActionPreviewTitle = { bg = colors.dark.eerie, fg = colors.dark.other },
			CodeActionText = { bg = colors.dark.eerie, fg = colors.dark.other },
			CodeActionNumber = { bg = colors.dark.eerie, fg = colors.dark.other },
			SagaImpIcon = { bg = colors.dark.eerie, fg = colors.dark.eerie },
			RenameNormal = { bg = colors.dark.eerie, fg = colors.dark.other },
			DiagnosticText = { bg = colors.dark.eerie, fg = colors.dark.other },
			SagaWinbarSep = { bg = colors.dark.eerie, fg = colors.dark.other },

			-- telescope
			TelescopeBorder = { bg = colors.dark.eerie, fg = colors.dark.charcoal },
			TelescopeMatching = { fg = colors.yellow.sunglow },
			TelescopeNormal = { bg = colors.dark.eerie },
			TelescopePreviewTitle = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },
			TelescopePromptTitle = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },
			TelescopeResultsTitle = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },
			TelescopeSelectionCaret = { fg = colors.red.cg },
			TelescopeSelection = { bg = colors.dark.eerie, fg = colors.yellow.sunglow },

			-- GitSigns
			GitSignsAdd = { bg = colors.dark.eerie },
			GitSignsChange = { bg = colors.dark.eerie },
			GitSignsChangeInline = { bg = colors.dark.eerie },
			GitSignsDeleteInline = { bg = colors.dark.eerie },
			GitSignsAddInline = { bg = colors.dark.eerie },
			GitSignsAddPreview = { bg = colors.dark.eerie },
			GitSignsDeletePreview = { bg = colors.dark.eerie },
			GitSignsCurrentLineBlame = { bg = colors.dark.eerie },
		}
	end,
})
