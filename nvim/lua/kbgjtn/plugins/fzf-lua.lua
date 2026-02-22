return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
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
				rg_opts = "--hidden --column --line-number --no-heading --smart-case -g '!node_modules/*' -g '!.git/*'",
			},
			files = {
				fd_opts = [[--type f --hidden --exclude .git --exclude node_modules]],
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
		})

		-- keymaps equivalent to your Telescope setup
		local keymap = vim.keymap

		keymap.set("n", "<leader>hh", function()
			fzf.highlights({ fzf_colors = true })
		end, { desc = "List highlight groups" })

		keymap.set("n", "<leader>ff", function()
			fzf.files({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>fr", function()
			fzf.oldfiles({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>fs", function()
			fzf.live_grep({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>fc", function()
			fzf.grep_cword({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>fh", function()
			fzf.help_tags({ fzf_colors = true })
		end)

		-- Git pickers
		keymap.set("n", "<leader>gc", function()
			fzf.git_commits({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>gfc", function()
			fzf.git_bcommits({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>gb", function()
			fzf.git_branches({ fzf_colors = true })
		end)

		keymap.set("n", "<leader>gs", function()
			fzf.git_status({ fzf_colors = true })
		end)

		keymap.set("n", "<C-p>", function()
			fzf.git_files({ fzf_colors = true })
		end)

		-- buffer diagnostics
		vim.keymap.set("n", "<leader>db", function()
			fzf.diagnostics_document({ fzf_colors = true })
		end, { desc = "fzf: Buffer Diagnostics" })

		vim.keymap.set("n", "<leader>dw", function()
			fzf.diagnostics_workspace({ fzf_colors = true })
		end, { desc = "fzf: Workspace Diagnostics" })

		-- Marks dropdown (previewer = false)
		keymap.set("n", "<leader>fm", function()
			fzf.marks({
				fzf_colors = true,
				winopts = { preview = { hidden = true } },
			})
		end)

		vim.keymap.set("n", "<leader>tt", function()
			require("fzf-lua").tabs({ fzf_colors = true })
		end, { desc = "Search open tabs" })

		-- Current buffer fuzzy find (dropdown style)
		keymap.set("n", "<leader>/", function()
			fzf.blines({
				fzf_colors = true,
				winopts = { preview = { hidden = true } },
			})
		end)
	end,
}
