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
		themeable = false,
		numbers = "none",
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		middle_mouse_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		close_icon = "",
		right_trunc_marker = "",
		left_trunc_marker = "",
		diagnostics = "nvim_lsp",
		max_name_length = 18,
		color_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})
