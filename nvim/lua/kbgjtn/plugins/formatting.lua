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
            go = { "gofumpt", "goimports", "goimports-reviser", "golines", "gomodifytags", "gotests" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            lua = { "stylua" },
            bash = { "shfmt" },
            zsh = { "shfmt" },
            java = { "google_java_format" },
            templ = { "html" },
            proto = { "buf" },
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
