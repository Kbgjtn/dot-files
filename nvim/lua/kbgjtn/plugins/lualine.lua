local status, lualine = pcall(require, "lualine")
local colors = require("kbgjtn.utils.color")

if not status then
	return
end

local bubbles_theme = {
	normal = {
		a = { fg = colors.grey.tints, bg = colors.none },
		b = { fg = colors.grey.tints, bg = colors.none },
		c = { fg = colors.grey.tints, bg = colors.none },
	},
	insert = { a = { fg = colors.dark.chinese, bg = colors.none } },
	visual = { a = { fg = colors.dark.chinese, bg = colors.none } },
	replace = { a = { fg = colors.dark.chinese, bg = colors.none } },
	inactive = {
		a = { fg = colors.grey.tints, bg = colors.none },
		b = { fg = colors.grey.tints, bg = colors.none },
		c = { fg = colors.dark.chinese, bg = colors.none },
	},
}

lualine.setup({
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
		theme = bubbles_theme,
		icons_enabled = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
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
