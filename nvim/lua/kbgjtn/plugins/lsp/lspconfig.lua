return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		ui = {
			windows = {
				default_options = {
					border = "rounded",
				},
			},
		},
	},

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		-- local border = {
		-- 	{ "╭", "FloatBorder" }, -- Rounded upper-left corner (boldish)
		-- 	{ "─", "FloatBorder" }, -- Bold horizontal line
		-- 	{ "╮", "FloatBorder" }, -- Rounded upper-right corner (boldish)
		-- 	{ "│", "FloatBorder" }, -- Bold vertical line
		-- 	{ "╯", "FloatBorder" }, -- Rounded lower-right corner (boldish)
		-- 	{ "─", "FloatBorder" }, -- Bold horizontal line
		-- 	{ "╰", "FloatBorder" }, -- Rounded lower-left corner (boldish)
		-- 	{ "│", "FloatBorder" }, -- Bold vertical line
		-- }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			--[[ opts.desc = "Show buffer diagnostics in location list"
			vim.keymap.set("n", "<leader>dl", function()
				vim.diagnostic.setloclist({ open = true })
			end, opts) ]]

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function()
				return vim.diagnostic.jump({ count = -1, float = true })
			end, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function()
				return vim.diagnostic.jump({ count = 1, float = true })
			end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", function()
				return vim.lsp.buf.hover({
					border = "rounded",
					title = "",
					max_width = 80,
					max_height = 20,
					min_width = 16,
					focusable = true,
					loadfile = true,
				})
			end, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.offsetEncoding = { "utf-8", "utf-16" }

		vim.diagnostic.config({
			underline = true,
			virtual_text = false,
			virtual_lines = false,
			severity_sort = true,
			signs = false,
			update_in_insert = true,
			float = {
				max_width = 80,
				max_height = 30,
				wrap = true,
				border = "rounded",
				source = true,
			},
		})

		-- vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
		-- 	config = config or {}
		-- 	config.border = "rounded"
		-- 	config.max_width = 20
		-- 	config.max_height = 20
		-- 	config.min_width = 10
		-- 	return vim.lsp.util.open_floating_preview(result.contents, "markdown", config)
		-- end

		-- vim.lsp.buf.hover({
		-- 	border = "rounded",
		-- 	title = "abcd",
		-- 	max_width = 50,
		-- 	max_height = 16,
		-- 	min_width = 20,
		-- 	loadfile = true,
		-- })

		vim.lsp.buf.signature_help({
			border = "rounded",
			title = "",
			max_width = 50,
			min_width = 20,
			loadfile = true,
		})

		-- local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰘥 ", Info = "󰋽 " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		vim.lsp.config("*", {
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.enable("yamlls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("zls")

		vim.lsp.enable("ts_ls")
		vim.lsp.enable("html")
		-- vim.lsp.enable("tailwindcss")

		vim.lsp.config("zls", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "zls" },
			filetypes = { "zig", "zir" },
			settings = {
				zls = {
					enable_argument_placeholders = false,
					warn_style = true,
				},
			},
			root_markers = {
				".git",
				"build.zig",
			},
			single_file_support = true,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("yamlls", {
			format = {
				enable = true,
				singleQuote = true,
				bracketSpacing = true,
			},
			filetypes = { "yml", "yaml" },
			validate = true,
			completion = true,
		})

		vim.lsp.config("gopls", {
			-- root_dir = vim.fs.dirname(vim.fs.find({ "go.sum", "go.mod", "*.go", "go.work", ".git" }, { upward = true })[1]),
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod" },
			root_markers = {
				"go.sum",
				"go.mod",
				"go.work",
				".git",
			},
			settings = {
				gopls = {
					analyses = {
						rangeint = false,
					},
					staticcheck = false,
					gofumpt = true,
				},
			},
		})

		vim.lsp.config("cmake", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "typescript-language-server", "--stdio" },
			root_markers = {
				"package.json",
			},
			workspace_required = true,
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})

		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact" },
			init_options = { userLanguages = { templ = "html" } },
		})

		vim.lsp.config("htmx", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ" },
			init_options = { userLanguages = { templ = "html" } },
		})

		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"templ",
				"astro",
				"markdown",
				"javascript",
				"react",
				"typescript",
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"django-html",
				"edge",
				"eelixir",
				"ejs",
				"erb",
				"eruby",
				"gohtml",
				"haml",
				"handlebars",
				"hbs",
				"html",
				"html-eex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
			},
			-- root_dir = function(fname)
			-- 	return lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts")(fname)
			-- 		or lspconfig.util.root_pattern("*.md", ".md")(fname)
			-- 		or lspconfig.util.root_pattern("postcss.config.js", "postcss.config.ts")(fname)
			-- 		or lspconfig.util.find_package_json_ancestor(fname)
			-- 		or lspconfig.util.find_node_modules_ancestor(fname)
			-- 		or lspconfig.util.find_git_ancestor(fname)
			-- end,
			init_options = { userLanguages = { templ = "html" } },
			settings = {
				tailwindCSS = {
					classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
					includeLanguages = {
						templ = "html",
					},
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidConfigPath = "error",
						invalidScreen = "error",
						invalidTailwindDirective = "error",
						invalidVariant = "error",
						recommendedVariantOrder = "warning",
					},
					validate = true,
				},
			},
		})

		vim.lsp.config("marksman", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "markdown", "markdown.mdx", "md", "mdx" },
			-- root_dir = lspconfig.util.root_pattern("*.md", ".md"),
		})

		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			on_attach = on_attach,

			filetypes = {
				"html",
				"astro",
				"templ",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
			},
			init_options = { userLanguages = { templ = "html" } },
		})

		vim.lsp.config("bashls", {
			capabilities = capabilities,
			on_attach = on_attach,
			single_file_support = true,
		})

		vim.lsp.config("buf_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			-- filetypes = { "proto" },
			-- root_dir = lspconfig.util.root_pattern("*.proto"),
			-- cmd = { "buf", "beta", "lsp", "--timeout=0", "--log-format=text" },
			filetypes = { "proto" },
			--root_dir = lspconfig.util.root_pattern("buf.yaml", "buf.work.yaml", ".git"),
			single_file_support = true,
		})

		vim.lsp.config("templ", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "templ" },
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "c", "c++", "h" },
			--root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt"),
		})

		vim.lsp.config("phpactor", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "php" },
			--root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
		})
	end,
}
