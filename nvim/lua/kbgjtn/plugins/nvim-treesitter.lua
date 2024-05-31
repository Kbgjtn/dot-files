return {
   {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPre", "BufNewFile" },
      build = ":TSUpdate",
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
         "windwp/nvim-ts-autotag",
      },
      config = function()
         local treesitter = require("nvim-treesitter.configs")

         treesitter.setup({
            highlight = { enable = false },
            indent = { enable = true },
            autotag = { enable = true },
            query_linter = {
               enable = true,
               use_virtual_text = true,
               lint_events = { "BufWrite", "CursorHold" },
            },
            ensure_installed = {
               "json",
               "javascript",
               "typescript",
               "tsx",
               "yaml",
               "html",
               "css",
               "prisma",
               "markdown",
               "bash",
               "lua",
               "vim",
               "go",
               "dockerfile",
               "gitignore",
               "templ",
               "query",
            },
            incremental_selection = {
               enable = true,
               keymaps = {
                  init_selection = "<C-space>",
                  node_incremental = "<C-space>",
                  scope_incremental = false,
                  node_decremental = "<bs>",
               },
            },
         })

         require("ts_context_commentstring").setup({})

         local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
         parser_config.gotmpl = {
            install_info = {
               url = "https://github.com/ngalaiko/tree-sitter-go-template",
               files = { "src/parser.c" },
            },
            filetype = "gotmpl",
            used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
         }
      end,
   },
}
