return {
   "joerdav/templ.vim",
   event = { "VeryLazy" },
   config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      -- start the templ language server for go projects with .templ files
      if not configs.templ then
         configs.templ = {
            default_config = {
               cmd = { "templ", "lsp", "-http=localhost:7474", "-log=/tmp/templ.log" },
               filetypes = { "templ" },
               root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
            },
         }
      end
      lspconfig.templ.setup({})
   end,
}
