return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "|" },
				change = { text = "|" },
				delete = { text = "_" },
				topdelete = { text = "⎻" },
				changedelete = { text = "~" },
				untracked = { text = "¦" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "⎻" },
				changedelete = { text = "~" },
				untracked = { text = "¦" },
			},
			signs_staged_enable = true,
			signcolumn = true,
		},
		keys = {
			-- Navigation
			{
				"]c",
				function()
					require("gitsigns").next_hunk()
				end,
				desc = "Next Git hunk",
			},
			{
				"[c",
				function()
					require("gitsigns").prev_hunk()
				end,
				desc = "Prev Git hunk",
			},
			-- Actions

			{
				"<leader>hs",
				function()
					local gs = require("gitsigns")
					if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
						local start = vim.fn.line("v")
						local finish = vim.fn.line(".")
						if start > finish then
							start, finish = finish, start
						end
						gs.stage_hunk({ start, finish })
					else
						gs.stage_hunk()
					end
				end,
				mode = { "n", "v" },
				desc = "Stage hunk",
			},
			{
				"<leader>hr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset hunk",
			},
			{
				"<leader>hS",
				function()
					require("gitsigns").stage_buffer()
				end,
				desc = "Stage buffer",
			},
			{
				"<leader>hR",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "Reset buffer",
			},
			{
				"<leader>hp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview hunk",
			},
			{
				"<leader>hi",
				function()
					require("gitsigns").preview_hunk_inline()
				end,
				desc = "Preview hunk inline",
			},
			{
				"<leader>hb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Blame line",
			},
			{
				"<leader>hd",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diff this",
			},
			{
				"<leader>hD",
				function()
					require("gitsigns").diffthis("~")
				end,
				desc = "Diff this vs HEAD",
			},
			{
				"<leader>hq",
				function()
					require("gitsigns").setqflist()
				end,
				desc = "Git hunks to qflist",
			},
			{
				"<leader>hQ",
				function()
					require("gitsigns").setqflist("all")
				end,
				desc = "All Git hunks to qflist",
			},
			-- Toggles
			{
				"<leader>tb",
				function()
					require("gitsigns").toggle_current_line_blame()
				end,
				desc = "Toggle line blame",
			},
			{
				"<leader>tw",
				function()
					require("gitsigns").toggle_word_diff()
				end,
				desc = "Toggle word diff",
			},
		},
	},
}
