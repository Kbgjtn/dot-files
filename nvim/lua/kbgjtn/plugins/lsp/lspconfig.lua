-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lsp_lines = require("lsp_lines")

lsp_lines.setup({
	icons = {
		--[[ Error = "",
		Warning = "",
		Information = "",
		Hint = "", ]]
	},
})

if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_kump_prev<CR>", opts) -- kump to previous diagnostic in buffer
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_kump_next<CR>", opts) -- kump to next diagnostic in buffer
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

capabilities.offsetEncoding = "utf-16"

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = false,
	virtual_text = true,
	underline = false,
})

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.phpactor.setup({
	root_dir = function(_)
		return vim.loop.cwd()
	end,
	init_options = {
		["language_server.diagnostics_on_update"] = false,
		["language_server.diagnostics_on_open"] = false,
		["language_server.diagnostics_on_save"] = false,
		["language_server.diagnostics_delay"] = 0,
		["language_server.diagnostics_enable"] = false,
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
	settings = {
		language_server = {
			diagnosticls = {
				filetypes = { "php" },
				init_options = {
					provideFormatter = false,
					settings = {
						php = {
							analysis = {
								disable = { "phpstan", "psalm" },
							},
						},
					},
				},
			},
		},
	},
})

require("go").setup({
	on_attach = on_attach,
	lsp_cfg = {
		capabilities = capabilities,
	},
	disable_defaults = true, -- true|false when true set false to all boolean settings and replace all table
	-- settings with {}
	go = "go", -- go command, can be go[default] or go1.18beta1
	goimport = "gopls", -- goimport command, can be gopls[default] or either goimport or golines if need to split long lines
	fillstruct = "gopls", -- default, can also use fillstruct
	gofmt = "gofumpt", --gofmt cmd,
	max_line_len = 128, -- max line length in golines format, target maximum line length for golines
	tag_transform = true, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
	tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
	gotests_template = "", -- sets gotests -template parameter (check gotests for details)
	gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
	comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. 󰟓       
	icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
	verbose = false, -- output loginf in messages
	-- false: do nothing
	-- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
	--   lsp_cfg = {settings={gopls={matcher='caseinsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
	--      when lsp_cfg is true
	-- if lsp_on_attach is a function: use this function as on_attach function for gopls
	lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
	lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
	-- function(bufnr)
	--    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", {noremap=true, silent=true})
	-- end
	-- to setup a table of codelens
	diagnostic = { -- set diagnostic to false to disable vim.diagnostic setup
		hdlr = false, -- hook lsp diag handler and send diag to quickfix
		underline = false,
		-- virtual text setup
		virtual_text = { spacing = 0, prefix = "■" },
		signs = true,
		update_in_insert = false,
	},
	lsp_document_formatting = true,
	-- set to true: use gopls to format
	-- false if you want to use other formatter tool(e.g. efm, nulls)
	lsp_inlay_hints = {
		enable = true,
		-- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
		-- inlay only avalible for 0.10.x
		style = "inlay",
		-- note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
		-- only show inlay hints for the current line
		only_current_line = false,
		-- event which triggers a refersh of the inlay hints.
		-- you can make this "cursormoved" or "cursormoved,cursormovedi" but
		-- not that this may cause higher cpu usage.
		-- this option is only respected when only_current_line and
		-- autosethints both are true.
		only_current_line_autocmd = "cursorhold",
		-- whether to show variable name before type hints with the inlay hints or not
		-- default: false
		show_variable_name = true,
		-- prefix for parameter hints
		parameter_hints_prefix = "󰊕 ",
		show_parameter_hints = true,
		-- prefix for all the other hints (type, chaining)
		other_hints_prefix = "=> ",
		-- whether to align to the lenght of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 6,
		-- the color of the hints
		highlight = "comment",
	},
	gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
	gopls_remote_auto = true, -- add -remote=auto to gopls
	gocoverage_sign = "█",
	sign_priority = 5, -- change to a higher number to override other signs
	dap_debug = true, -- set to false to disable dap
	dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
	dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
	dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

	dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
	dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
	dap_retries = 20, -- see dap option max_retries
	build_tags = "tag1,tag2", -- set default build tags
	textobjects = true, -- enable default text jobects through treesittter-text-objects
	test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
	verbose_tests = true, -- set to add verbose flag to tests deprecated, see '-v' option
	run_in_floaterm = false, -- set to true to run in a float window. :gotermclose closes the floatterm
	-- float term recommend if you use richgo/ginkgo with terminal color

	floaterm = { -- position
		posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
		width = 0.45, -- width of float window if not auto
		height = 0.98, -- height of float window if not auto
		title_colors = "", -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
		-- can also set to a list of colors to define colors to choose from
		-- e.g {'#d8dee9', '#5e81ac', '#88c0d0', '#ebcb8b', '#a3be8c', '#b48ead'}
	},
	trouble = false, -- true: use trouble to open quickfix
	test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
	luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
	--  do not enable this if you already added the path, that will duplicate the entries
	on_jobstart = function(cmd)
		_ = cmd
	end, -- callback for stdout
	on_stdout = function(err, data)
		_, _ = err, data
	end, -- callback when job started
	on_stderr = function(err, data)
		_, _ = err, data
	end, -- callback for stderr
	on_exit = function(code, signal, output)
		_, _, _ = code, signal, output
	end, -- callback for jobexit, output : string
	iferr_vertical_shift = 4, -- defines where the cur
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

local util = require("lspconfig/util")

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy", "--header-insertion=iwyu" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	gopls_cmd = "gopls",
	fillstruct = "gopls",
	dap_debug = true,
	dap_debug_gui = true,
	settings = {
		gopls = {
			analyses = {
				assign = true,
				atomic = true,
				bools = true,
				composites = true,
				copylocks = true,
				deepequalerrors = true,
				embed = true,
				errorsas = true,
				fieldalignment = true,
				httpresponse = true,
				ifaceassert = true,
				loopclosure = true,
				lostcancel = true,
				nilfunc = true,
				nilness = true,
				nonewvars = true,
				printf = true,
				shadow = true,
				shift = true,
				simplifycompositelit = true,
				simplifyrange = true,
				simplifyslice = true,
				sortslice = true,
				stdmethods = true,
				stringintconv = true,
				structtag = true,
				testinggoroutine = true,
				tests = true,
				timeformat = true,
				umarshal = true,
				unreachable = true,
				unsafeptr = true,
				unusedparams = true,
				unusedresult = true,
				unusedvariable = true,
				useany = true,
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
})

vim.keymap.set("", "<leader>l", require("lsp_lines").toggle, { desc = "toggle lsp_lines" })

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$vimruntime/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

local language_servers = lspconfig.util.available_servers()

for _, server in pairs(language_servers) do
	if server ~= "lua_ls" then
		lspconfig[server].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end
end
