return {
   "stevearc/conform.nvim",
   lazy = true,
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local conform = require("conform")
      conform.setup({
         formatters_by_ft = {
            proto = { "buf" },
            lua = { "stylua" },
            sql = { "sqlfmt" },
            templ = { "templ" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            go = { "goimports" },
            sh = { "shfmt" },
            shell = { "shfmt" },
         },
         format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
         },
         log_level = vim.log.levels.ERROR,
         notify_on_error = true,
      })

      vim.keymap.set({ "n", "v" }, "<leader>p", function()
         conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
         })
      end, { desc = "Format file or range (in visual mode)" })
   end,
}
