return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                proto = { "buf" },
                lua = { "stylua" },
                templ = { "templ" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "yamlfmt" },
                yml = { "yamlfmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                go = { "goimports" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                shell = { "shfmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                rust = { "rustfmt" },
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
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
