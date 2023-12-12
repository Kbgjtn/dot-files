-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lsp_lines = require("lsp_lines")

lsp_lines.setup({
	icons = {
		--[[ Error = "",
		Warning = "",
		Information = "",
		Hint = "", ]]
		Error = " ",
		Warning = " ",
		Information = " ",
		Hint = " ",
	},
})

if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
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

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.offsetEncoding = "utf-16"
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
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
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
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
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.mod", "go.work", ".git"),
})

vim.diagnostic.config({
	virtual_text = false,
})

vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- configure lua server (with special settings)
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
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
