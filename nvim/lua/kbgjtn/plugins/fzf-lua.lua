return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	keys = {
		-- Core
		{
			"<leader>hh",
			function()
				require("fzf-lua").highlights({ fzf_colors = true })
			end,
			desc = "Highlights",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files({ fzf_colors = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").oldfiles({ fzf_colors = true })
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps({ fzf_colors = true })
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fq",
			function()
				require("fzf-lua").command_history({ fzf_colors = true })
			end,
			desc = "Command History",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep({ fzf_colors = true })
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").grep_cword({ fzf_colors = true })
			end,
			desc = "Grep Word Under Cursor",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags({ fzf_colors = true })
			end,
			desc = "Help Tags",
		},

		-- Git
		{
			"<leader>gc",
			function()
				require("fzf-lua").git_commits({ fzf_colors = true })
			end,
			desc = "Git Commits",
		},
		{
			"<leader>gfc",
			function()
				require("fzf-lua").git_bcommits({ fzf_colors = true })
			end,
			desc = "Git Buffer Commits",
		},
		{
			"<leader>gb",
			function()
				require("fzf-lua").git_branches({ fzf_colors = true })
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gs",
			function()
				require("fzf-lua").git_status({ fzf_colors = true })
			end,
			desc = "Git Status",
		},
		{
			"<C-p>",
			function()
				require("fzf-lua").git_files({ fzf_colors = true })
			end,
			desc = "Git Files",
		},

		-- Diagnostics
		{
			"<leader>db",
			function()
				require("fzf-lua").diagnostics_document({ fzf_colors = true })
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>dw",
			function()
				require("fzf-lua").diagnostics_workspace({ fzf_colors = true })
			end,
			desc = "Workspace Diagnostics",
		},

		-- Marks (no preview)
		{
			"<leader>fm",
			function()
				require("fzf-lua").marks({
					fzf_colors = true,
					winopts = { preview = { hidden = true } },
				})
			end,
			desc = "Marks",
		},

		-- Tabs
		{
			"<leader>tt",
			function()
				require("fzf-lua").tabs({ fzf_colors = true })
			end,
			desc = "Search Tabs",
		},

		-- Buffer lines (dropdown style)
		{
			"<leader>/",
			function()
				require("fzf-lua").blines({
					fzf_colors = true,
					winopts = { preview = { hidden = true } },
				})
			end,
			desc = "Search in Buffer",
		},
	},
	opts = {
		winopts = {
			height = 0.64,
			width = 0.72,
			preview = {
				vertical = "up:36%",
				horizontal = "right:40%",
			},
		},

		fzf_opts = {
			["--prompt"] = " → ",
		},

		grep = {
			rg_opts = "--hidden --column --line-number --no-heading --smart-case -g '!node_modules/*' -g '!.zig-cache/*' -g '!.git/*'",
		},

		files = {
			fd_opts = [[--type f --hidden --exclude .git --exclude node_modules --exclude .zig-cache]],
			git_icons = false,
			file_icons = false,
			fzf_colors = true,
		},

		keymap = {
			builtin = {
				["<C-j>"] = "down",
				["<C-k>"] = "up",
				["<C-q>"] = "select-all+send-to-qf+open-qf",
			},
			fzf = {
				["ctrl-/"] = "toggle-preview",
				["ctrl-j"] = "down",
				["ctrl-k"] = "up",
			},
		},
	},
}
