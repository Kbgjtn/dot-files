return {
   "nvimtools/none-ls.nvim",
   lazy = true,
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
      "jay-babu/mason-null-ls.nvim",
   },
   config = function()
      local null_ls = require("null-ls")
      local mason_null_ls = require("mason-null-ls")
      local null_ls_utils = require("null-ls.utils")

      local formatting = null_ls.builtins.formatting
      local code_actions = null_ls.builtins.code_actions
      local completion = null_ls.builtins.completion
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      mason_null_ls.setup({
         ensure_installed = {
            "stylua",
            "buf",
            "cmakelang",
            "gofumpt",
            "gomodifytags",
            "gotests",
            "shfmt",
            "sqlfmt",
            "goimports",
         },
      })

      null_ls.setup({
         root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
         sources = {
            formatting.prettier.with({ extra_filetypes = { "svelte" } }),
            formatting.shfmt,
            formatting.stylua,
            --[[ formatting.markdownlint, ]]
            formatting.goimports,
            formatting.gofumpt,
            completion.spell,
            code_actions.gomodifytags,
            code_actions.impl,
            code_actions.impl,
         },

         on_attach = function(current_client, bufnr)
            if current_client.supports_method("textDocument/formatting") then
               vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
               vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                     vim.lsp.buf.format({
                        filter = function(client)
                           return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                     })
                  end,
               })
            end
         end,
      })
   end,
}
