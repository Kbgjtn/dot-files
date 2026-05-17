return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		columns = {
			"size",
		},
		override = { icon = "", name = "oil" },
	},
	keys = {
		{
			"-",
			function()
				require("oil").open()
			end,
			desc = "Open parent directory (Oil)",
		},
	},
}
