-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
local trouble = require("trouble.providers.telescope")

if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

vim.keymap.set("n", "<leader>b", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- configure telescope
telescope.setup({
	extentions = {},
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
	},
})
