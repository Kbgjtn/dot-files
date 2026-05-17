return {

	{
		"williamboman/mason.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "󱞩",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			input = {
				enabled = true,
				border = "rounded",
			},
			select = {
				enabled = true,
				relative = "editor",
				backend = { "telescope", "fzf_lua", "builtin" },
			},
		},
	},

	{ "tpope/vim-fugitive", event = "VeryLazy", lazy = true },
	{ "tpope/vim-surround", event = "VeryLazy", lazy = true },

	{
		"coocobolo/coocobolo.nvim",
		-- dir = "/home/ozy/code/personal/lua/coocobolo.nvim",
		opts = {
			accent = { default = "#B6B6B6" },
			enable_yank_highlight = true,
			clear_status_line = true,
			custom_palette = {
				blue = "#057DCD",
				red = "#F26E5A",
			},
		},
	},
}
