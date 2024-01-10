return {
   "stevearc/conform.nvim",
   lazy = true,
   event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
   config = function()
      local conform = require("conform")
      conform.setup({
         formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            go = { "gofumpt" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
         },
         format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
         },
      })

      vim.keymap.set({ "n", "v" }, "<leader>p", function()
         print("try to make this file pretty for you ....")

         conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
         })
      end, { desc = "Format file or range (in visual mode)" })
   end,
}
