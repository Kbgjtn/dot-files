local colors = {
   dark = {
      chinese = "#101010",
      elitle = "#191919",
      eerie = "#1A1A1A",
      raisin = "#222222",
      charcoal = "#303030",
      liver = "#323232",
      soft = "#45474B",
      softest = "#6e7177",
      other = "#606060",
   },
   grey = {
      tints = "#989898",
      argent = "#C1C1C1",
      tones = "#606060",
      light = "#d9d9d9",
      suplight = "#999999",
   },
   red = {
      softest = "#ff6666",
      soft = "#f26e5a",
      cg = "#E0654A",
   },
   yellow = {
      sunglow = "#FFC436",
      sunglow_dim = "#FFD05E",
      soft = "#FFD099",
   },
   orange = {
      beer = "#FB8B24",
      chinese = "#FFB000",
      soft = "#F3B664",
   },
   green = {
      funky = "#E9EDC9",
      pear = "#D2DE32",
      granny = "#c2e1b7",
   },
   none = "NONE",
}

--[[ vim.api.nvim_set_hl(0, "Normal", { bg = colors.dark.elitle, fg = colors.dark.softest })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.dark.eerie, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "NormalNC", { bg = colors.dark.eerie, fg = colors.grey.tones })
vim.api.nvim_set_hl(0, "NormalSB", { bg = colors.dark.eerie, fg = colors.grey.tones })
vim.api.nvim_set_hl(0, "SignalColumn", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "SignalSign", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.dark.eerie, fg = colors.none })

vim.api.nvim_set_hl(0, "Cursor", { bg = colors.dark.liver, fg = colors.yellow.soft })
vim.api.nvim_set_hl(0, "lCursor", { bg = colors.dark.liver, fg = colors.grey.light })
vim.api.nvim_set_hl(0, "CursorIM", { bg = colors.dark.liver, fg = colors.grey.light })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.dark.raisin, fg = colors.none, bold = false, italic = false })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.dark.charcoal, fg = colors.none, bold = false, italic = false })
vim.api.nvim_set_hl(
   0,
   "CursorLineSign",
   { bg = colors.dark.charcoal, fg = colors.yellow.sunglow_dim, bold = false, italic = false }
)

vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = colors.dark.eerie, fg = colors.dark.eerie, bold = false, italic = false })

-- CursorLineSign
vim.api.nvim_set_hl(
   0,
   "CursorLineSign",
   { bg = colors.dark.eerie, fg = colors.dark.charcoal, bold = false, italic = false }
)
vim.api.nvim_set_hl(0, "LineNr", { bg = colors.dark.eerie, fg = colors.dark.charcoal, bold = false, italic = false })
vim.api.nvim_set_hl(
   0,
   "cursorlinenr",
   { bg = colors.dark.eerie, fg = colors.yellow.sunglow, bold = false, italic = false }
)

vim.api.nvim_set_hl(0, "visual", { bg = colors.dark.raisin, fg = colors.none, bold = true, italic = false })

vim.api.nvim_set_hl(
   0,
   "CurSearch",
   { bg = colors.dark.raisin, fg = colors.yellow.sunglow, bold = true, underline = true }
)
vim.api.nvim_set_hl(0, "Conceal", { bg = colors.dark.charcoal, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "CursorIM", { bg = colors.dark.charcoal, fg = colors.yellow.sunglow })

vim.api.nvim_set_hl(0, "Search", { bg = colors.none, fg = colors.orange.chinese, bold = true, standout = false })
vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "HlSearch", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })

vim.api.nvim_set_hl(0, "Folded", { bg = colors.dark.eerie, fg = colors.dark.charcoal, bold = false, italic = false })
vim.api.nvim_set_hl(
   0,
   "FoldColumn",
   { bg = colors.dark.eerie, fg = colors.dark.charcoal, bold = false, italic = false }
)

vim.api.nvim_set_hl(0, "NonText", { bg = colors.dark.eerie, fg = colors.green.funky, bold = false, italic = false })
vim.api.nvim_set_hl(
   0,
   "MatchParen",
   { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim, bold = true, italic = false }
)

vim.api.nvim_set_hl(0, "FloatTitle", { bg = colors.dark.eerie, fg = colors.dark.liver })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.dark.eerie, fg = colors.dark.liver })

-- SYNTAX
-- Comment
vim.api.nvim_set_hl(0, "Comment", { bg = colors.none, fg = colors.dark.soft, bold = false, italic = false })
vim.api.nvim_set_hl(0, "SpecialComment", {
   bg = colors.dark.eerie,
   fg = colors.yellow.sunglow_dim,
   sp = colors.yellow.sunglow_dim,
   bold = false,
   italic = false,
})

vim.api.nvim_set_hl(0, "Constant", { fg = colors.green.funky, bold = false, italic = false })
vim.api.nvim_set_hl(0, "String", { fg = colors.dark.softest, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Character", { fg = colors.green.pear, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Float", { fg = colors.grey.tones, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.dark.softest, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.grey.tints, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Number", { fg = colors.grey.tones, bold = true, italic = false })

vim.api.nvim_set_hl(0, "Operator", { fg = colors.grey.argent, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Function", { fg = colors.yellow.sunglow_dim, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.red.cg, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Conditional", { fg = colors.red.cg, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Repeat", { fg = colors.red.cg, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.red.cg, bold = false })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = colors.yellow.sunglow_dim, bold = false })
vim.api.nvim_set_hl(0, "Type", { fg = colors.grey.tones, bold = true })
vim.api.nvim_set_hl(0, "Typedef", { fg = colors.grey.suplight, bold = true })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.red.cg, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Define", { fg = colors.red.cg, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Macro", { fg = colors.red.cg, bold = false, italic = false })
vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.red.cg, bold = false, italic = false })
vim.api.nvim_set_hl(0, "Include", { fg = colors.dark.other, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Struct", { fg = colors.red.softest, bold = true, italic = false })
vim.api.nvim_set_hl(0, "Special", { fg = colors.dark.other })
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.dark.liver })
vim.api.nvim_set_hl(0, "Tag", { fg = colors.dark.liver })
vim.api.nvim_set_hl(0, "Debug", { fg = colors.green.granny })
vim.api.nvim_set_hl(0, "Bold", { fg = colors.dark.softest, bold = true })
vim.api.nvim_set_hl(0, "Underlined", { fg = colors.dark.softest, underline = true })
vim.api.nvim_set_hl(0, "Italic", { fg = colors.dark.softest, italic = true })
vim.api.nvim_set_hl(0, "Error", { fg = colors.red.softest, bold = true })
vim.api.nvim_set_hl(0, "Todo", { bg = colors.none, fg = colors.green.funky, bold = true })

-- MDX stuff
vim.api.nvim_set_hl(0, "Title", { fg = colors.dark.softest, bold = true })

-- tree-sitter
vim.api.nvim_set_hl(0, "@conditional.go", { fg = colors.dark.softest, bold = true })

--- @conceal.vimdoc links to @conceal vimdoc
vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = colors.dark.other, bold = false })
vim.api.nvim_set_hl(0, "@keyword.tsx", { fg = colors.grey.tones, bold = false })
vim.api.nvim_set_hl(0, "@keyword.function.tsx", { fg = colors.grey.tones, bold = true })

vim.api.nvim_set_hl(0, "@label.vimdoc", { fg = colors.dark.softest, bold = false })
vim.api.nvim_set_hl(0, "@conceal.vimdoc", { fg = colors.dark.soft, bold = false })
vim.api.nvim_set_hl(0, "@parameter.vimdoc", { fg = colors.red.softest, bold = false })
vim.api.nvim_set_hl(0, "@text.literal.block.vimdoc", { fg = colors.grey.light, bold = false })
vim.api.nvim_set_hl(0, "@text.reference.vimdoc", { fg = colors.grey.tints, bold = false }) ]]
--[[ ["@tag"] = { fg = C.mauve }, -- Tags like html tag names.
["@tag.attribute"] = { fg = C.teal, style = { "italic" } }, -- Tags like html tag names.
["@tag.delimiter"] = { fg = C.sky },  ]]

--[[ vim.api.nvim_set_hl(0, "@tag", { fg = colors.dark.other, bold = false })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.dark.other, bold = false })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = colors.dark.other, bold = false })

-- htmlH1
vim.api.nvim_set_hl(0, "healthError", { fg = colors.red.softest, bold = true })
vim.api.nvim_set_hl(0, "healthWarning", { fg = colors.orange.chinese, bold = true })
vim.api.nvim_set_hl(0, "healthSuccess", { fg = colors.green.granny, bold = true })

vim.api.nvim_set_hl(0, "diffRemoved", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffChanged", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffOldFile", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffNewFile", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffFile", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffLine", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "diffINdexLine", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.dark.soft, bold = true })
vim.api.nvim_set_hl(0, "DiffText", { fg = colors.dark.soft, bold = true })

vim.api.nvim_set_hl(0, "OilDir", { bg = colors.none, fg = colors.dark.softest, bold = true })
vim.api.nvim_set_hl(0, "OilDirIcon", { fg = colors.none, bold = false })
vim.api.nvim_set_hl(0, "OilFile", { bg = colors.none, fg = colors.dark.softest, bold = false })

vim.api.nvim_set_hl(0, "CmpNormal", { bg = colors.none, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = colors.none, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "CmpPopupNormal", { bg = colors.none, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "CmpPopupNormalSelected", { bg = colors.none, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = colors.none, fg = colors.dark.other })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = colors.none, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = colors.none, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = colors.none, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "CmpItemKind", { bg = colors.none, fg = colors.orange.chinese })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.red.soft })

-- window separator split
vim.api.nvim_set_hl(0, "VertSplit", { bg = colors.dark.eerie, fg = colors.dark.eerie })
vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.dark.eerie, fg = colors.dark.liver, bold = true })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.dark.eerie, fg = colors.none, bold = true })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = colors.dark.eerie, fg = colors.dark.liver, bold = true })

-- telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = colors.dark.eerie, fg = colors.dark.charcoal })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.red.cg })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.dark.eerie })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = colors.dark.eerie, fg = colors.yellow.sunglow })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.red.cg })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.dark.eerie, fg = colors.none })

-- DiagnosticError
vim.api.nvim_set_hl(0, "DiagnosticError", { bg = colors.dark.eerie, fg = colors.red.softest, bold = true })
-- DiagnosticVirtualTextError
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = colors.none, fg = colors.red.softest })

-- Command line
-- ModeMsg
vim.api.nvim_set_hl(0, "ModeMsg", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim, bold = true })
-- MoreMsg
vim.api.nvim_set_hl(0, "MoreMsg", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim, bold = true })
-- MsgArea
vim.api.nvim_set_hl(0, "MsgArea", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim, bold = true })

-- ErrorMsg
vim.api.nvim_set_hl(0, "ErrorMsg", { bg = colors.dark.eerie, fg = colors.red.softest, bold = true })
-- WarningMsg
vim.api.nvim_set_hl(0, "WarningMsg", { bg = colors.dark.eerie, fg = colors.orange.chinese, bold = true })

-- WildMenu
vim.api.nvim_set_hl(0, "WildMenu", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "WildMenuSelected", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim }) ]]

-- winbar
-- Pmenu		normal item  |hl-Pmenu|
-- PmenuSel	selected item  |hl-PmenuSel|
-- PmenuSbar	scrollbar  |hl-PmenuSbar|
-- PmenuThumb	thumb of the scrollbar  |hl-PmenuThumb|
--[[ vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.dark.eerie, fg = colors.dark.soft })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.dark.eerie, fg = colors.red.soft })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.dark.eerie, fg = colors.yellow.sunglow_dim })
vim.api.nvim_set_hl(0, "PopupWindowBorder", { bg = colors.dark.eerie, fg = colors.dark.softest }) ]]

-- TODO:
-- 1. FLOATING WINDOW HIGHLIGHT COLORS
-- 2. TERMINAL HIGHLIGHT COLORS
-- 3. LSP HIGHLIGHT COLORS
-- 4. GIT HIGHLIGHT COLORS
-- 5. INACTIVE BUFFER TABLINE COLORS

return colors
