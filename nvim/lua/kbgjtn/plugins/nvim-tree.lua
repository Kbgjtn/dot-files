-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeEndOfBuffer guifg=#1c1c1c]])
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#1c1c1c]])
vim.cmd([[ highlight NvimTreeVertSplit guifg=#1c1c1c]])
vim.cmd([[ highlight NvimTreeNormal guibg=NONE guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFolderName guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeEmptyFolderName guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFileIcon guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFileName guifg=#DED0B6]])

nvimtree.setup({
	renderer = {
		icons = {
			git_placement = "before",
			padding = " ",
			symlink_arrow = "",
			web_devicons = {
				file = {
					enable = true,
				},
			},
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
		highlight_opened_files = "icon",
		indent_markers = {
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		indent_width = 2,
		root_folder_label = ":t",
	},
	update_focused_file = {
		enable = true,
		debounce_delay = 15,
		update_root = true,
		ignore_list = {},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		ignore = false,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = false,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
	},
})
