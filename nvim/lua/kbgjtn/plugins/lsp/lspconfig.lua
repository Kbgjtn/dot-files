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

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts)

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

            opts.desc = "Open diagnostic list"
            keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", function()
                return vim.lsp.buf.hover({
                    border = "rounded",
                    title = "",
                    max_width = 50,
                    max_height = 20,
                    min_width = 16,
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
            signs = false,
            update_in_insert = true,
            float = {
                max_width = 56,
                max_height = 30,
                wrap = false,
                border = "rounded",
            },
        })

        vim.lsp.buf.signature_help({
            border = "rounded",
            title = "",
            max_width = 50,
            min_width = 20,
            loadfile = true,
        })

        local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰘥 ", Info = "󰋽 " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.lsp.config("*", {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        vim.lsp.enable("gopls")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("html")
        vim.lsp.enable("yamlls")
        vim.lsp.enable("tailwindcss")

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = {
                ".luarc.json",
                ".luarc.jsonc",
                ".luacheckrc",
                ".stylua.toml",
                ".git",
            },
            settings = {
                Lua = {
                    telemetry = {
                        enable = false,
                    },
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

        vim.lsp.config("cssls", {
            capabilities = capabilities,
            on_attach = on_attach(),
            root_markers = {
                ".css",
            },
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
            on_attach = on_attach(),
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
                    experimentalPostfixCompletions = true,
                    analyses = {
                        assign = true,
                        atomic = true,
                        bools = true,
                        composites = true,
                        copylocks = true,
                        deepequalerrors = true,
                        embed = true,
                        errorsas = true,
                        fieldalignment = false,
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

        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("phpactor", {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "php" },
            --root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
        })
    end,
}
