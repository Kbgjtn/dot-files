return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>p",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "yamlfmt" },
			yml = { "yamlfmt" },
			go = { "goimports" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			shell = { "shfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },

			-- rust = { "rustfmt" },
			-- proto = { "buf" },
			-- templ = { "templ" },
			-- javascript = { "prettier" },
			-- typescript = { "prettier" },
			-- javascriptreact = { "prettier" },
			-- typescriptreact = { "prettier" },
		},
		format_on_save = {
			async = false,
			lsp_format = "fallback",
			timeout_ms = 250,
		},
		log_level = vim.log.levels.ERROR,
		notify_on_error = false,
	},
}
