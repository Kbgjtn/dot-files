local autocmd = vim.api.nvim_create_autocmd

-- templ
autocmd({ "BufWritePre" }, {
   pattern = "*.templ",
   callback = function()
      vim.cmd("TSBufEnable highlight")
      vim.cmd("TSBufEnable indent")
   end,
})

-- auto wrap text in markdown
autocmd({ "BufReadPre", "BufWritePre" }, {
   pattern = { "*.mdx", "*.md" },
   callback = function()
      local textwidth = vim.api.nvim_get_option_value("textwidth", {})
      local wrapmargin = vim.api.nvim_get_option_value("wrapmargin", {})

      if textwidth > 0 or wrapmargin > 0 then
         vim.cmd("set wrap")
      end
   end,
})

-- auto wrap text in markdown
autocmd({ "BufReadPre" }, {
   pattern = { "*.go", "Makefile", "*.templ" },
   callback = function()
      local textwidth = vim.api.nvim_get_option_value("textwidth", {})
      local wrapmargin = vim.api.nvim_get_option_value("wrapmargin", {})

      if textwidth > 0 or wrapmargin > 0 then
         vim.cmd("set tabstop=5")
         vim.cmd("set softtabstop=5")
         vim.cmd("set shiftwidth=5")
      end
   end,
})
