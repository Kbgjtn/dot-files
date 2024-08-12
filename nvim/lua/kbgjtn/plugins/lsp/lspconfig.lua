return {
   "neovim/nvim-lspconfig",
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
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
      vim.lsp.set_log_level("off")
      local lspconfig = require("lspconfig")
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
         keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

         opts.desc = "Show LSP implementations"
         keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

         opts.desc = "Show LSP type definitions"
         keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

         opts.desc = "See available code actions"
         keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

         opts.desc = "Smart rename"
         keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

         opts.desc = "Show buffer diagnostics"
         keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts)

         opts.desc = "Show line diagnostics"
         keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

         opts.desc = "Go to previous diagnostic"
         keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

         opts.desc = "Go to next diagnostic"
         keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

         opts.desc = "Show documentation for what is under cursor"
         keymap.set("n", "K", vim.lsp.buf.hover, opts)

         opts.desc = "Restart LSP"
         keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

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

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
         border = "rounded",
         title = "",
         max_width = 50,
         min_width = 20,
         loadfile = true,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
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

      lspconfig["jdtls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig["cmake"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig["html"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "html", "typescriptreact", "javascriptreact", "templ" },
      })

      lspconfig["htmx"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "html", "templ" },
      })

      lspconfig["tsserver"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig["cssls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig["tailwindcss"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "templ", "markdown", "javascript", "react", "typescript" },
         root_dir = lspconfig.util.root_pattern("*.md", ".md"),
         init_options = {
            userLanguages = {
               templ = "html",
            },
         },
         settings = {
            tailwindCSS = {
               includeLanguages = {
                  templ = "html",
               },
            },
         },
      })

      lspconfig["prismals"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      lspconfig["emmet_ls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      lspconfig["gopls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "go" },
         root_dir = lspconfig.util.root_pattern("go.sum", "go.mod", "*.go", "go.work", ".git"),
         cmd = { "gopls" },
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
               staticcheck = true,
               gofumpt = true,
            },
         },
      })

      --NOTE: tetst
      lspconfig["marksman"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "markdown", "md", "mdx" },
         root_dir = lspconfig.util.root_pattern("*.md", ".md"),
      })

      lspconfig["grammarly"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "markdown", "md", "mdx" },
         root_dir = lspconfig.util.root_pattern("*.md", ".md"),
         init_options = {
            userLanguages = {
               markdown = "markdown",
               md = "markdown",
               mdx = "markdown",
            },
         },
      })

      lspconfig["bashls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "sh" },
         root_dir = lspconfig.util.root_pattern(".sh"),
         single_file_support = true,
      })

      lspconfig["bufls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "proto" },
         root_dir = lspconfig.util.root_pattern("*.proto"),
      })

      lspconfig["templ"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "templ" },
      })

      lspconfig["phpactor"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "php" },
         root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
      })

      lspconfig["lua_ls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         settings = {
            Lua = {
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
   end,
}
