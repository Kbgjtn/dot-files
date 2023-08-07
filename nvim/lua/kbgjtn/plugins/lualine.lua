local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local mocha = require("catppuccin.palettes").get_palette("mocha")

local colors = {
	blue = "#73ab84",
	cyan = "#3dccc7",
	black = "#101010",
	white = "#c6c6c6",
	red = "#ff5189",
	yellow = "#fdc500",
	grey = "#212121",
	none = "",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.yellow },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.none },
	},
	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

lualine.setup({
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
		theme = bubbles_theme,
		icons_enabled = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
