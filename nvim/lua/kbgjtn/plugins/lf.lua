local status, lf = pcall(require, "lf")

if not status then
	return
end

lf.setup({
	dir = "",
	tmux = false,
	winblend = 0,
	mappings = true,
	border = "rounded",
	escape_quit = false,
	direction = "float",
	focus_on_open = true,
	layout_mapping = "<M-u>",
	default_file_manager = false,
	disable_netrw_warning = true,
	highlights = { NormalFloat = { guibg = "NONE" } },
	default_action = "drop",
	default_actions = {
		["<C-t>"] = "tabedit",
		["<C-x>"] = "split",
		["<C-v>"] = "vsplit",
		["<C-o>"] = "tab drop",
	},
	views = {
		{ width = 0.800, height = 0.800 },
		{ width = 0.600, height = 0.600 },
		{ width = 0.950, height = 0.950 },
		{ width = 0.500, height = 0.500, col = 0, row = 0 },
		{ width = 0.500, height = 0.500, col = 0, row = 0.5 },
		{ width = 0.500, height = 0.500, col = 0.5, row = 0 },
		{ width = 0.500, height = 0.500, col = 0.5, row = 0.5 },
	},
})
