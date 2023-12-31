local bufferline_setup, bufferline = pcall(require, "bufferline")

if not bufferline_setup then
	return
end

local color = {
	highlights = {
		fill = {
			bg = "#101010",
		},
		background = {
			bg = "#101010",
		},
		tab = {
			bg = "#101010",
		},
		tab_selected = {
			bg = "#101010",
		},
		tab_separator = {
			bg = "#101010",
		},
		tab_separator_selected = {
			bg = "#101010",
		},
		tab_close = {
			bg = "#101010",
		},
		close_button = {
			bg = "#101010",
		},
		close_button_visible = {
			bg = "#101010",
		},
		close_button_selected = {
			bg = "#101010",
		},
		buffer_visible = {
			bg = "#101010",
		},
		buffer_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		numbers = {
			bg = "#101010",
		},
		numbers_visible = {
			bg = "#101010",
		},
		numbers_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		diagnostic = {
			bg = "#101010",
		},
		diagnostic_visible = {
			bg = "#101010",
		},
		diagnostic_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		hint = {
			fg = "<colour-value-here>",
			sp = "<colour-value-here>",
			bg = "#101010",
		},
		hint_visible = {
			fg = "<colour-value-here>",
			bg = "#101010",
		},
		hint_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		hint_diagnostic = {
			bg = "#101010",
		},
		hint_diagnostic_visible = {
			bg = "#101010",
		},
		hint_diagnostic_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		info = {
			bg = "#101010",
		},
		info_visible = {
			bg = "#101010",
		},
		info_selected = {
			bg = "#101010",
			bold = true,
			italic = false,
		},
		info_diagnostic = {
			bg = "#101010",
		},
		info_diagnostic_visible = {
			bg = "#101010",
		},
		info_diagnostic_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		warning = {
			bg = "#101010",
		},
		warning_visible = {
			bg = "#101010",
		},
		warning_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		warning_diagnostic = {
			bg = "#101010",
		},
		warning_diagnostic_visible = {
			bg = "#101010",
		},
		warning_diagnostic_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		error = {
			bg = "#101010",
		},
		error_visible = {
			bg = "#101010",
		},
		error_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		error_diagnostic = {
			bg = "#101010",
		},
		error_diagnostic_visible = {
			bg = "#101010",
		},
		error_diagnostic_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		modified = {
			bg = "#101010",
		},
		modified_visible = {
			bg = "#101010",
		},
		modified_selected = {
			bg = "#101010",
		},
		duplicate_selected = {
			bg = "#101010",
			italic = false,
		},
		duplicate_visible = {
			bg = "#101010",
			italic = false,
		},
		duplicate = {
			bg = "#101010",
			italic = false,
		},
		separator_selected = {
			bg = "#101010",
		},
		separator_visible = {
			bg = "#101010",
		},
		separator = {
			bg = "#101010",
		},
		indicator_visible = {
			bg = "#101010",
		},
		indicator_selected = {
			bg = "#101010",
		},
		pick_selected = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		pick_visible = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		pick = {
			bg = "#101010",
			bold = false,
			italic = false,
		},
		offset_separator = {
			bg = "#101010",
		},
		trunc_marker = {
			bg = "#101010",
		},
	},
}

bufferline.setup({
	options = {
		mode = "buffers",
		higlight = color.highlights,
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
			bufferline.style_preset.minimal,
		},
		toggle_hidden_on_enter = true,
		enabled = false,
		themeable = true,
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		middle_mouse_command = nil,
		left_mouse_command = "buffer %d",
		close_icon = "",
		right_trunc_marker = "",
		left_trunc_marker = "",
		max_name_length = 18,
		tab_size = 10,
		seperator_style = { "", "" },
		color_icons = false,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
	},
})

--[[ local map = vim.api.nvim_set_keymap
map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true }) ]]
