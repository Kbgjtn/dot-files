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
		enabled = true,
		themeable = true,
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		middle_mouse_command = nil,
		left_mouse_command = "buffer %d",
		close_icon = "",
		right_trunc_marker = "",
		left_trunc_marker = "",
		max_name_length = 18,
		tab_size = 10,
		seperator_style = { "", "" },
		color_icons = false,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
	},
})
