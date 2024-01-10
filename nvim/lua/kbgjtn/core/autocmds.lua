vim.lsp.start({
   name = "start lsp configuration", -- No idea whether this should be "more unique" 🤷
   cmd = { "gopls" },
   root_dir = "/home/bono/Documents/.code/go/",
})

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
   keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

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
local autocmd = vim.api.nvim_create_autocmd

-- GOLPS
autocmd("FileType", {
   pattern = "go",
   callback = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local filetypes = { "go.mod", "go.work", ".git" }
      local root_dir = vim.fs.dirname(vim.fs.find(filetypes, { upward = true })[1])
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local settings = {
         gopls = {
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
         on_attach = on_attach,
      })

      vim.lsp.buf_attach_client(0, client)
   end,
})
