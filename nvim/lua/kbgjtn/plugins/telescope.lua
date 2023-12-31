local telescope_setup, telescope = pcall(require, "telescope")
local trouble = require("trouble.providers.telescope")

if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	extensions = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
	},
})
