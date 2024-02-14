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
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap -- for conciseness

      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
         opts.buffer = bufnr

         -- set keybinds
         opts.desc = "Show LSP references"
         keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

         opts.desc = "Go to declaration"
         keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

         opts.desc = "Show LSP definitions"
         keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

         opts.desc = "Show LSP implementations"
         keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

         opts.desc = "Show LSP type definitions"
         keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

         opts.desc = "See available code actions"
         keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

         opts.desc = "Smart rename"
         keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

         opts.desc = "Show buffer diagnostics"
         keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts) -- show  diagnostics for file

         opts.desc = "Show line diagnostics"
         keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

         opts.desc = "Go to previous diagnostic"
         keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

         opts.desc = "Go to next diagnostic"
         keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

         opts.desc = "Show documentation for what is under cursor"
         keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

         opts.desc = "Restart LSP"
         keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.diagnostic.config({

         underline = true,
         virtual_text = false,
         signs = false,
         update_in_insert = false,
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

      -- open float diagnostics on cursor hold

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
         local hl = "DiagnosticSign" .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      lspconfig["jdtls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      -- configure html server

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

      -- configure typescript server with plugin
      lspconfig["tsserver"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
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
         filetypes = { "templ", "markdown", "javascript", "react", "typescript" },
         init_options = {
            userLanguages = {
               templ = "html",
            },
         },
      })

      -- configure prisma orm server
      lspconfig["prismals"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
      })

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      lspconfig["grammarly"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         filetypes = { "markdown", "md", "mdx" },
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
         filetypes = { "bash", "zsh" },
      })

      lspconfig["bufls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
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

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
         capabilities = capabilities,
         on_attach = on_attach,
         settings = { -- custom settings for lua
            Lua = {
               -- make the language server recognize "vim" global
               diagnostics = {
                  globals = { "vim" },
               },
               workspace = {
                  -- make language server aware of runtime files
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
