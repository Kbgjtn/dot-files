return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	opts = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		local opts = {
			-- global diagnostic defaults (used later in config)
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				virtual_lines = false,
				severity_sort = true,
				signs = false,
				float = {
					header = "",
					max_width = 80,
					max_height = 30,
					wrap = true,
					border = "rounded",
					source = true,
				},
			},
			-- on_attach used for all servers
			on_attach = function(_, bufnr)
				local map_opts = { noremap = true, silent = true, buffer = bufnr }

				map_opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)

				map_opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)

				map_opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)

				map_opts.desc = "Show LSP type definitions"
				keymap.set("n", "gy", vim.lsp.buf.type_definition, map_opts)

				map_opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, map_opts)

				map_opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)

				map_opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, map_opts)

				map_opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					return vim.diagnostic.jump({ count = -1, float = true })
				end, map_opts)

				map_opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					return vim.diagnostic.jump({ count = 1, float = true })
				end, map_opts)

				map_opts.desc = "Show documentation for what is under cursor"
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
				end, map_opts)

				map_opts.desc = "Restart LSP"
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", map_opts)
			end,
			-- capabilities
			capabilities = (function()
				local caps = cmp_nvim_lsp.default_capabilities()
				caps.textDocument.completion.completionItem.snippetSupport = true
				caps.offsetEncoding = { "utf-8", "utf-16" }
				return caps
			end)(),

			-- servers table: configure servers here
			servers = {
				["*"] = {
					capabilities = {
						workspace = {
							fileOperations = {
								didRename = true,
								willRename = true,
							},
						},
					},
					keys = {
						{ "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
						{ "gr", vim.lsp.buf.references, desc = "References", nowait = true },
						{ "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
						{ "gy", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
						{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
						{
							"K",
							function()
								return vim.lsp.buf.hover()
							end,
							desc = "Hover",
						},
						{
							"<c-k>",
							function()
								return vim.lsp.buf.signature_help()
							end,
							mode = "i",
							desc = "Signature Help",
							has = "signatureHelp",
						},
						{
							"<leader>ca",
							vim.lsp.buf.code_action,
							desc = "Code Action",
							mode = { "n", "x" },
							has = "codeAction",
						},
						{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
						{
							"<leader>cc",
							vim.lsp.codelens.run,
							desc = "Run Codelens",
							mode = { "n", "x" },
							has = "codeLens",
						},
						{
							"<leader>cC",
							vim.lsp.codelens.refresh,
							desc = "Refresh & Display Codelens",
							mode = { "n" },
							has = "codeLens",
						},
					},
				},

				-- lua_ls with proper runtime/workspace settings
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim", "LazyVim" } },
							workspace = {
								library = {
									vim.fn.expand("$VIMRUNTIME/lua"),
									vim.fn.stdpath("config") .. "/lua",
								},
								checkThirdParty = false,
							},
							telemetry = { enable = false },
							codeLens = { enable = true },
							completion = { callSnippet = "Replace" },
							doc = { privateName = { "^_" } },
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},

				-- other servers (kept from your original)
				zls = {
					capabilities = true, -- will be merged with global capabilities in config
					on_attach = true,
					cmd = { "/home/ozy/.zvm/bin/zls" },
					filetypes = { "zig", "zon" },
					settings = {
						zls = {
							enable_argument_placeholders = false,
							warn_style = true,
							inlay_hints_hide_redundant_param_names = true,
							inlay_hints_hide_redundant_param_names_last_token = true,
						},
					},
					single_file_support = true,
					root_markers = { ".git", "build.zig" },
				},

				cssls = true,
				rust_analyzer = true,

				yamlls = {
					filetypes = { "yml", "yaml" },
					settings = {
						yaml = {
							format = { enable = true, singleQuote = true, bracketSpacing = true },
						},
					},
				},

				gopls = {
					on_attach = true,
					capabilities = true,
					cmd = { "gopls" },
					filetypes = { "go", "gomod" },
					root_markers = { "go.sum", "go.mod", "go.work", ".git" },
					settings = {
						gopls = {
							analyses = { rangeint = false },
							staticcheck = false,
							gofumpt = true,
						},
					},
				},
				cmake = true,
				ts_ls = {
					cmd = { "typescript-language-server", "--stdio" },
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
				},
				html = {
					filetypes = { "html", "typescriptreact", "javascriptreact" },
					init_options = { userLanguages = { templ = "html" } },
				},
				-- htmx = { filetypes = { "html", "templ" }, init_options = { userLanguages = { templ = "html" } } },
				-- tailwindcss = {
				-- 	filetypes = {
				-- 		"templ",
				-- 		"astro",
				-- 		"markdown",
				-- 		"javascript",
				-- 		"react",
				-- 		"typescript",
				-- 		"aspnetcorerazor",
				-- 		"astro-markdown",
				-- 		"blade",
				-- 		"django-html",
				-- 		"edge",
				-- 		"eelixir",
				-- 		"ejs",
				-- 		"erb",
				-- 		"eruby",
				-- 		"gohtml",
				-- 		"haml",
				-- 		"handlebars",
				-- 		"hbs",
				-- 		"html",
				-- 		"html-eex",
				-- 		"jade",
				-- 		"leaf",
				-- 		"liquid",
				-- 		"mdx",
				-- 		"mustache",
				-- 		"njk",
				-- 		"nunjucks",
				-- 		"php",
				-- 		"razor",
				-- 		"slim",
				-- 		"twig",
				-- 		"css",
				-- 		"less",
				-- 		"postcss",
				-- 		"sass",
				-- 		"scss",
				-- 		"stylus",
				-- 		"sugarss",
				-- 		"javascriptreact",
				-- 		"reason",
				-- 		"rescript",
				-- 		"vue",
				-- 		"svelte",
				-- 	},
				-- 	init_options = { userLanguages = { templ = "html" } },
				-- 	settings = {
				-- 		tailwindCSS = {
				-- 			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
				-- 			includeLanguages = { templ = "html" },
				-- 			lint = {
				-- 				cssConflict = "warning",
				-- 				invalidApply = "error",
				-- 				invalidConfigPath = "error",
				-- 				invalidScreen = "error",
				-- 				invalidTailwindDirective = "error",
				-- 				invalidVariant = "error",
				-- 				recommendedVariantOrder = "warning",
				-- 			},
				-- 			validate = true,
				-- 		},
				-- 	},
				-- },

				-- marksman = { filetypes = { "markdown", "markdown.mdx", "md", "mdx" } },

				-- emmet_ls = {
				-- 	filetypes = {
				-- 		"html",
				-- 		"astro",
				-- 		"templ",
				-- 		"typescriptreact",
				-- 		"javascriptreact",
				-- 		"css",
				-- 		"sass",
				-- 		"scss",
				-- 		"less",
				-- 		"svelte",
				-- 	},
				-- 	init_options = { userLanguages = { templ = "html" } },
				-- },
				bashls = { single_file_support = true },
				-- buf_ls = { filetypes = { "proto" }, single_file_support = true },
				-- templ = { filetypes = { "templ" } },
				clangd = { filetypes = { "c", "c++", "h" } },
				-- phpactor = { filetypes = { "php" } },
			},

			-- optional per-server setup overrides
			setup = {},
		}

		return opts
	end,

	config = function(_, opts)
		-- apply diagnostics config
		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		-- register formatter (if you use LazyVim.format)
		-- if LazyVim and LazyVim.format and LazyVim.lsp then
		-- 	LazyVim.format.register(LazyVim.lsp.formatter())
		-- end

		-- set global "*" config first if present
		if opts.servers["*"] then
			vim.lsp.config("*", opts.servers["*"])
		end

		-- helper to normalize server options and configure then enable
		local have_mason = pcall(require, "mason-lspconfig")
		local mason_map = have_mason and require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package or {}
		local mason_all = vim.tbl_keys(mason_map)

		local mason_exclude = {}

		local function configure(server)
			if server == "*" then
				return false
			end
			local sopts = opts.servers[server]
			sopts = sopts == true and {} or (not sopts and { enabled = false }) or sopts

			if sopts.enabled == false then
				mason_exclude[#mason_exclude + 1] = server
				return
			end

			local use_mason = sopts.mason ~= false and vim.tbl_contains(mason_all, server)
			local setup_fn = opts.setup[server] or opts.setup["*"]
			if setup_fn and setup_fn(server, sopts) then
				mason_exclude[#mason_exclude + 1] = server
			else
				-- merge common capabilities/on_attach if server opts reference true
				if sopts.on_attach == true then
					sopts.on_attach = opts.on_attach
				end
				if sopts.capabilities == true then
					sopts.capabilities = opts.capabilities
				end

				vim.lsp.config(server, sopts) -- register config
				if not use_mason then
					vim.lsp.enable(server) -- enable after config
				end
			end
			return use_mason
		end

		local servers = vim.tbl_keys(opts.servers)
		local install = vim.tbl_filter(configure, servers)

		if have_mason then
			require("mason-lspconfig").setup({
				ensure_installed = vim.list_extend(install, {}),
				automatic_enable = { exclude = mason_exclude },
			})
		end
	end,
}
