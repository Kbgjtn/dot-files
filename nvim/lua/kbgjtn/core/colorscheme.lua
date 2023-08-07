---@diagnostic disable-next-line: param-type-mismatch
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
local theme = require("catppuccin")

if not status then
	print("colorscheme not found!") -- print error if colorscheme not installed
	return
end

theme.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- force no italic
	no_bold = false, -- force no bold
	no_underline = false, -- force no underline
	styles = { -- handles the styles of general hi groups (see `:h highlight-args`):
		comments = {}, -- change the style of comments
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		all = {},
		latte = {},
		frappe = {},
		macchiato = {},
		mocha = {},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = false,
		bufferline = true,
		-- for more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup for colorscheme gruvbox
--[[ theme.setup({
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
	invert_diff = true,
	inverse = false, -- invert background for search, diffs, statuslines and errors
	contrast = "soft", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
		signcolumn = { bg = "#101010" },
		cursorline = { bg = "#131515" },
		cursorlinenr = { fg = "#fdca40", bg = "" },
		comment = { fg = "#efc88b" },
		visual = { bg = "#191919" },
	},
	dim_inactive = false,
	transparent_mode = true,
}) ]]
