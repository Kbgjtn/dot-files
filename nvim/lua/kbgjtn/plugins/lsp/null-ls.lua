-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")

if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.gofumpt,
		formatting.goimports_reviser,
		formatting.golines,
		formatting.google_java_format,
		formatting.prettierd,
		formatting.shfmt,
		formatting.clang_format.with({
			diagnostics_format = "#{m} [#{c}]",
			extra_args = { "-style=google" },
			formatting_options = {
				["C_Cpp.clang_format_style"] = "google",
			},
		}),
		formatting.prettier,
		formatting.stylua,

		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc" or ".eslintrc.json") -- change file extension if you use something else
			end,
		}),
	},

	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
