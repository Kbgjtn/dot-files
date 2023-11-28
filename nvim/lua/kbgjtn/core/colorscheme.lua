---@diagnostic disable-next-line: param-type-mismatch
local status, theme = pcall(require, "kanagawa")
vim.cmd("colorscheme kanagawa")

theme.load("dragon")
theme.setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = false },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {
			CursorLine = { bg = "#1c1c1c" },
			SingnalColumn = { bg = "#1c1c1c" },
			LineNr = { bg = "#1c1c1c" },
			CopilotSuggestion = { bg = "#f3f3f3" },
		}
	end,
	theme = "dragon", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "dragon", -- try "dragon" !
		light = "lotus",
	},
	enableTreesitter = true,
})

--[[ theme.setup({
	italic_comments = true,
	plugins = {
		cmp = true,
		indent_blankline = true,
		nvim_tree = true,
		telescope = true,
		which_key = true,
		barbar = true,
		notify = true,
		symbols_outline = true,
		neo_tree = true,
		gitsigns = true,
		crates = true,
		hop = true,
		navic = true,
		quickscope = true,
		flash = true,
		lspkind = true,
		lsp_trouble = true,
		bufferline = true,
	},
}) ]]

if not status then
	print("colorscheme not found!") -- print error if colorscheme not installed
	return
end

--[[ theme.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
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
	palette_overrides = function()
		return {}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = false,
		bufferline = false,
		telescope = true,
		-- for more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
}) ]]

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
	invert_selection = true,
	invert_signs = true,
	invert_tabline = true,
	invert_intend_guides = true,
	invert_diff = false,
	inverse = false, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
}) ]]
