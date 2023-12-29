local home = vim.fn.expand("$HOME")
local jdk_path = home .. "/.sdkman/candidates/java/current/bin/java"

local nvim_data_path = vim.fn.stdpath("data") .. "/"
local mason_package_path = nvim_data_path .. "mason/packages" .. "/"
local jdtls_path = mason_package_path .. "jdtls/"

local project_dir = require("jdtls.setup").find_root({ ".git", "gradlew", "pom.xml" })

local project_name = vim.fn.fnamemodify(project_dir, ":p:h:t")

local jdtls = require("jdtls")

local lang_server_path = vim.fn.getcwd() .. "lang-servers/intellij-java-google-style.xml"

local function nnoremap(rhs, lhs, bufopts, desc)
	bufopts.desc = desc
	vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Regular Neovim LSP client keymappings
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
	nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
	nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
	nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
	nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
	nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
	nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
	nnoremap("<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts, "List workspace folders")
	nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
	nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
	nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
	vim.keymap.set(
		"v",
		"<space>ca",
		"<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
	)
	nnoremap("<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts, "Format file")

	-- Java extensions provided by jdtls
	nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
	nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
	nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
	vim.keymap.set(
		"v",
		"<space>em",
		[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
		{ noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
	)
end

--[[ local bundles = {
	vim.fn.glob(
		"/home/bono/.local/share/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.50.0.jar"
	),
}

vim.list_extend(bundles, vim.split(vim.fn.glob("/home/bono/.local/share/vscode-java-test/server/*.jar", 1), "\n")) ]]

local config = {
	flags = {
		debounce_text_changes = 80,
	},
	cmd = {
		jdk_path,

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. jdtls_path .. "lombok.jar",
		"-jar",
		vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar", 1),
		"-configuration",
		(jdtls_path .. "config_linux"),

		-- directory where jdtls stores project related data
		"-data",
		(nvim_data_path .. "jdtls_data/" .. project_name),
	},
	root_dir = project_dir,
	settings = {
		java = {
			signatureHelp = { enabled = true },
			autobuild = { enabled = false },
			codeGeneration = {
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
			contentProvider = {
				preferred = "fernflower",
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			format = {
				enabled = true,
				settings = {
					url = lang_server_path,
					profile = "GoogleStyle",
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},

	on_attach = function(_, bufnr)
		vim.lsp.codelens.refresh()

		require("jdtls.dap").setup_dap_main_class_configs()
		require("jdtls.setup").add_commands()

		jdtls.setup_dap({ hotcodereplace = "auto" })

		local map = function(mode, lhs, rhs, desc)
			if desc then
				desc = desc
			end
			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
		end

		-- Register keymappings

		local keys = { mode = { "n", "v" }, ["<leader>lj"] = { name = "+Java" } }

		map("n", "<leader>ljo", jdtls.organize_imports, "Organize Imports")
		map("n", "<leader>ljv", jdtls.extract_variable, "Extract Variable")
		map("n", "<leader>ljc", jdtls.extract_constant, "Extract Constant")
		map("n", "<leader>ljt", jdtls.test_nearest_method, "Test Nearest Method")
		map("n", "<leader>ljT", jdtls.test_class, "Test Class")
		map("n", "<leader>lju", "<cmd>JdtUpdateConfig<cr>", "Update Config")
		map("v", "<leader>ljv", "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable")
		map("v", "<leader>ljc", "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant")
		map("v", "<leader>ljm", "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method")

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.java" },
			callback = function()
				local _, _ = pcall(vim.lsp.codelens.refresh)
				-- run autoformat
				--  run auto import organize
				local params = {
					textDocument = vim.lsp.util.make_text_document_params(),
					options = vim.tbl_deep_extend("force", {
						insertSpaces = true,
						tabSize = 4,
					}, {}),
				}

				local result = vim.lsp.buf_request_sync(0, "textDocument/formatting", params)
				if not result or next(result) == nil then
					return
				end

				local view = vim.fn.winsaveview()
				vim.lsp.util.apply_text_edits(result[1].result, 0)
				vim.fn.winrestview(view)
				vim.lsp.buf.clear_references()
				vim.lsp.codelens.refresh()
			end,
		})
	end,
}

jdtls.start_or_attach(config)

--[[ 
--
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
		nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
		nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
		nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
		nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
		nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
		nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
		nnoremap("<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts, "List workspace folders")
		nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
		nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
		nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
		vim.keymap.set(
			"v",
			"<space>ca",
			"<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
			{ noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
		)
		nnoremap("<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts, "Format file")

		-- Java extensions provided by jdtls
		nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
		nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
		nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
		vim.keymap.set(
			"v",
			"<space>em",
			[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]]
--]]

-- 			{ noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
