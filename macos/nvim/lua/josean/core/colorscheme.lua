-- set colorscheme to nightfly with protected call
-- in case it isn't installed
--
local status, _ = pcall(vim.cmd, "colorscheme carbonfox")

if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

-- Default options
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "bold",
			keywords = "bold",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "bold",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {
		duskfox = {
			bg1 = "#000000", -- Black background
			bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
			bg3 = "#121820", -- 55% darkened from stock
			sel0 = "#131b24", -- 55% darkened from stock
		},
	},
	specs = {
		all = {},
		duskfox = {},
	},
	groups = {
		all = {},
	},
})
