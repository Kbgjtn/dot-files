require("oil").setup({
	columns = {
		"icon",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "",
	},
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = true,
		conceallevel = 3,
		concealcursor = "n",
	},
	default_file_explorer = true,
	restore_win_options = true,
	skip_confirm_for_simple_edits = false,
	delete_to_trash = false,
	trash_command = "trash-put",
	prompt_save_on_select_new_entry = false,
	prompt_delete_on_select_new_entry = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-v>"] = "actions.select_vsplit",
		["<C-h>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
	use_default_keymaps = true,
	float = {
		padding = 0,
		max_width = 0,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 10,
		},
	},
	preview = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = 0.9,
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		minimized_border = "none",
		win_options = {
			winblend = 0,
		},
	},
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
		-- This function defines what is considered a "hidden" file
		is_hidden_file = function(name, _)
			return vim.startswith(name, ".")
		end,
		-- This function defines what will never be shown, even when `show_hidden` is set
		is_always_hidden = function(_, _)
			return false
		end,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},
})

vim.keymap.set("n", "-", require("oil").open, { desc = "open parent directory in oil" })
