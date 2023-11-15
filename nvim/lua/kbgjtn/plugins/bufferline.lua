local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		separator_style = "|",
		themeable = true,
		numbers = "none",
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		close_icon = "",
		right_trunc_marker = "",
		left_trunc_marker = "",
		max_name_length = 18,
		tab_size = 10,
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				text_align = "center",
				separator = true,
				padding = 1,
			},
		},
	},
})
