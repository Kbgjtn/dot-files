return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"ray-x/cmp-sql",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					local luasnip = require("luasnip")
					local snip = luasnip.snippet
					local text_node = luasnip.text_node

					require("luasnip").filetype_extend("typescript", { "tsdoc" })
					require("luasnip").filetype_extend("javascript", { "jsdoc" })

					-- Jump forward
					vim.keymap.set({ "i", "s" }, "<Tab>", function()
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						end
					end, { silent = true })

					-- Jump backward
					vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { silent = true })

					luasnip.add_snippets("zig", {
						snip("println", {
							text_node({ 'std.debug.print("' }),
							luasnip.insert_node(1, ""), -- First insert: format string
							text_node({ '{}\\n", .{' }),
							luasnip.insert_node(2), -- Second insert: variables
							text_node({ "});" }),
						}),
					})

					luasnip.add_snippets("go", {
						snip("enn", {
							text_node({
								"if err != nil {",
								"  return ",
							}),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node({ "", "}" }),
						}),
						snip("en", {
							text_node({
								"; err != nil {",
								"  return ",
							}),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node({ "", "}" }),
						}),
						snip("ni", {
							text_node({
								'panic("not impelmented!")',
							}),
						}),
						snip("cx", {
							text_node({
								"ctx context.Context",
							}),
						}),
						snip("wrp", {
							text_node({ "w http.ResponseWriter, r *http.Request" }),
						}),
						-- snip("bf", {
						-- 	text_node("func Benchmark"),
						-- 	luasnip.insert_node(1, ""),
						-- 	text_node({
						-- 		"(b *testing.B) {",
						-- 		"}",
						-- 	}),
						-- 	luasnip.insert_node(0),
						-- }),
						snip("tsc", {
							text_node("func Test"),
							luasnip.insert_node(1, ""),
							text_node({
								"(t *testing.T) {",
								"  tests := []struct{",
								"     name string",
								"     in any",
								"     exp any",
								"     expErr error",
								"  }{",
								"     {",
								'        name: "",',
								"        in: nil,",
								"        exp: nil,",
								"        expErr: nil,",
								"     },",
								"  }",
								"",
								"  for _, tc := range tests {",
								"     t.Run(tc.name, func(t *testing.T) {",
								"     })",
								"  }",
								"}",
							}),
							luasnip.insert_node(0),
						}),
						snip("gorm", {
							text_node({ '`gorm:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("validate", {
							text_node({ '`validate:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("col", {
							text_node({ '`col:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("default", {
							text_node({ '`default:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("envconfig", {
							text_node({ '`envconfig:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("path", {
							text_node({ '`path:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("query", {
							text_node({ '`query:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("required", {
							text_node({ '`required:"' }),
							luasnip.insert_node(1, ""), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("split_words", {
							text_node({ '`split_words:"' }),
							luasnip.insert_node(1, "true"), -- Cursor will be placed here
							text_node('"`'),
						}),
						snip("rn", {
							text_node("return"),
						}),
						snip("ct", {
							text_node("continue"),
						}),
					})

					require("luasnip.loaders.from_vscode").lazy_load()

					luasnip.filetype_extend("typescriptreact", { "html" })
					luasnip.filetype_extend("templ", { "html", "tailwindcss", "htmx" })
					luasnip.filetype_extend("proto", { "proto" })
				end,
			},
		},
		config = function()
			-- Register nvim-cmp lsp capabilities
			vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

			local cmp = require("cmp")
			--local lspkind = require("lspkind")

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({ select = true }),
					["<C-q>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.confirm({ select = false }),
					["<C-d>"] = function()
						if cmp.visible_docs() then
							cmp.close_docs()
						else
							cmp.open_docs()
						end
					end,
				}),
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						entry_filter = function(entry, _)
							--return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
							return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
						end,
					},
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
					{ name = "sql" }, -- file system paths
				}),
				view = {
					docs = {
						auto_open = true,
					},
					entries = {
						name = "custom",
						selection_order = "top_down",
						follow_cursor = true,
					},
				},
				experimental = {
					-- only show ghost text when we show ai completions
					ghost_text = vim.g.ai_cmp and {
						hl_group = "CmpGhostText",
					} or false,
				},
				sorting = require("cmp.config.default")(),
				formatting = {
					fields = { cmp.ItemField.Abbr, cmp.ItemField.Menu },
					mode = "symbol",
					ellipsis_char = "...",

					format = function(entry, item)
						-- local icons = LazyVim.config.icons.kinds
						-- if icons[item.kind] then
						-- 	item.kind = icons[item.kind] .. item.kind
						-- end

						local widths = {
							abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 30,
							menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 40,
						}

						local source_icons = {
							nvim_lsp = "",
							nvim_lua = "",
							treesitter = "",
							path = "ܨ",
							buffer = "󰕸",
							zsh = "",
							vsnip = "",
							spell = "󰓆",
							luasnip = "",
							lspkind = "󰅪",
						}
						item.menu = source_icons[entry.source.name] or ""

						for key, width in pairs(widths) do
							if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
								item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "..."
							end
						end

						return item
					end,
				},
			})
		end,
	},
}
