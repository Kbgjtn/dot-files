return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                    local luasnip = require("luasnip")
                    local snip = luasnip.snippet
                    local text_node = luasnip.text_node

                    luasnip.add_snippets("go", {
                        snip("enn", {
                            text_node({
                                "if err != nil {",
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
                        snip("envconfig", {
                            text_node({ '`envconfig:"' }),
                            luasnip.insert_node(1, ""), -- Cursor will be placed here
                            text_node('"`'),
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
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

            local cmp = require("cmp")
            local lspkind = require("lspkind")

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
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-q>"] = function()
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
                            return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                        end,
                    },
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" }, -- file system paths
                }),
                view = {
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
                    fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind, cmp.ItemField.Menu },
                    format = lspkind.cmp_format({
                        mode = "symbol",
                        ellipsis_char = "...",
                        show_labelDetails = false,
                        max_width = 24,
                        before = function(entry, vim_item)
                            local str = require("cmp.utils.str")
                            local types = require("cmp.types")
                            vim_item.menu = ({
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
                            })[entry.source.name]

                            local word = entry:get_insert_text()
                            word = str.oneline(word)
                            if
                                entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                                and string.sub(vim_item.abbr, -1, -1) == "~"
                            then
                                word = word .. "~"
                            end
                            vim_item.abbr = word
                            return vim_item
                        end,
                    }),
                },
            })
        end,
    },
}
