-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- how to set marker end of nvimtree to be none
vim.cmd([[ highlight NvimTreeEndOfBuffer guifg=#1c1c1c]])
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#1c1c1c]])
vim.cmd([[ highlight NvimTreeVertSplit guifg=#1c1c1c]])
--how to set title NvimTree to  be none but not the icons and other
vim.cmd([[ highlight NvimTreeNormal guibg=NONE guifg=#DED0B6]])
-- the icons of nvimtree color to be white
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFolderName guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeEmptyFolderName guifg=#DED0B6]])

vim.cmd([[ highlight NvimTreeFileIcon guifg=#DED0B6]])
vim.cmd([[ highlight NvimTreeFileName guifg=#DED0B6]])

nvimtree.setup({
	renderer = {
		icons = {
			symlink_arrow = "",
			web_devicons = {
				file = {
					enable = true,
					color = false,
				},
			},
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = {},
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
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
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
})
