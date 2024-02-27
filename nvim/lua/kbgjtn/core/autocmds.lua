vim.lsp.start({
   name = "start lsp configuration", -- No idea whether this should be "more unique" 🤷
   cmd = { "gopls" },
   root_dir = "/home/",
})

local autocmd = vim.api.nvim_create_autocmd

-- GOLPS
autocmd({ "FileType", "BufWritePre" }, {
   pattern = "*.go",
   callback = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local filetypes = { "go.mod", "go.work", ".git" }
      local root_dir = vim.fs.dirname(vim.fs.find(filetypes, { upward = true })[1])
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local settings = {
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
               fieldalignment = true,
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
      }

      local client = vim.lsp.start({
         name = "gopls",
         cmd = { "gopls" },
         root_dir = root_dir,
         settings = settings,
         capabilities = capabilities,
         on_attach = K.on_attach,
      })

      vim.lsp.buf_attach_client(0, client)
   end,
})

-- templ
autocmd({ "BufWritePre" }, {
   pattern = "*.templ",
   callback = function()
      vim.cmd("TSBufEnable highlight")
      vim.cmd("TSBufEnable indent")
   end,
})
