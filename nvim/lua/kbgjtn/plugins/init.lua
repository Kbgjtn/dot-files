return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile", "VeryLazy" },
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
			require("Comment").setup({
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},

	{
		"stevearc/dressing.nvim",
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

	{
		event = { "VeryLazy" },
		lazy = true,
		"tpope/vim-fugitive",
		"inkarkat/vim-ReplaceWithRegister",
		"tpope/vim-surround",
		"christoomey/vim-tmux-navigator",
		"nvim-lua/plenary.nvim",
	},

	{
		dir = "/home/ozy/code/personal/lua/coocobolo.nvim",
		-- "coocobolo/coocobolo.nvim",
		priority = 1,
		opts = {
			accent = {
				colors = {
					"#7A7B4C", -- green
					"#E3635F", -- red
					"#D79FC7", -- purple
					"#057DCD", -- blue
				},
				-- default = "#BAB8B4",
				-- default = "#E3635F",
				-- default = "#5C5C5C",
				-- default = "#057DCD",
				randomize = true,
			},
			theme = "dark", -- "dark" or "light"
			dim_inactive = false,
			enable_yank_highlight = true, -- highlight group name [YankHighlight] if want to custom
			clear_status_line = true, -- hide and clear vertical and horizontal status_line
			custom_palette = {
				-- bg = "#000000",
				-- fg = "#000000",
				-- primary = "#000000",
				-- primary_6 = "#000000",
				-- primary_5 = "#000000",
				-- primary_4 = "#000000",
				-- primary_3 = "#000000",
				-- primary_2 = "#000000",
				-- green = "#000000",
				blue = "#057DCD",
				-- yellow = "#000000",
				-- primary_2 = "#4c4c4c",
				red = "#F26E5A",
			},
			highlights = {
				-- Normal = { bg = "#101010", fg = "#474747", bold = true },
			},
		},
	},

	-- {
	-- 	"andythigpen/nvim-coverage",
	-- 	event = "VeryLazy",
	-- 	rocks = { "lua-xmlreader" },
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("coverage").setup({
	-- 			signs = {
	-- 				covered = { hl = "CoverageCovered", text = "✔" },
	-- 				uncovered = { hl = "CoverageUncovered", text = "󱙝" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
