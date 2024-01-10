return {
   "hrsh7th/nvim-cmp",
   event = "InsertEnter",
   dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
   },
   config = function()
      local cmp = require("cmp")

      local luasnip = require("luasnip")

      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.filetype_extend("typescriptreact", { "html" })
      cmp.setup({
         completion = {
            completeopt = "menu,menuone,preview,noselect",
         },
         snippet = { -- configure how nvim-cmp interacts with snippet engine
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
         }),
         sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "treesitter" },
            { name = "vsnip" },
            { name = "path" },
            {
               name = "buffer",
               option = {
                  get_bufnrs = function()
                     return vim.api.nvim_list_bufs()
                  end,
               },
            },
            { name = "spell" },
            view = {
               entries = {
                  name = "custom",
                  selection_order = "top_down",
               },
               docs = {
                  auto_open = false,
                  max_width = 30,
                  border = "rounded",
               },
               window = {
                  completion = {
                     max_width = 20,
                     border = "rounded",
                     winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                     col_offset = -3,
                     side_padding = 2,
                     scrollbar = false,
                     scrolloff = 8,
                  },
                  documentation = {
                     border = "rounded",
                     winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
                     max_width = 24,
                  },
               },
            },
         }),
         experimental = {
            native_menu = false,
            ghost_text = false,
         },
         formatting = {
            fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind, cmp.ItemField.Menu },
            format = lspkind.cmp_format({
               mode = "symbol_text",
               max_width = 28,
               before = function(entry, vim_item)
                  local str = require("cmp.utils.str")
                  local types = require("cmp.types")
                  vim_item.menu = ({
                     nvim_lsp = "ﲳ",
                     nvim_lua = "",
                     treesitter = "",
                     path = "ﱮ",
                     buffer = "﬘",
                     zsh = "",
                     vsnip = "",
                     spell = "暈",
                  })[entry.source.name]

                  local word = entry:get_insert_text()
                  if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                     word = vim.lsp.util.parse_snippet(word)
                  end
                  word = str.oneline(word)
                  if
                     entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
                     and string.sub(vim_item.abbr, -1, -1) == "~"
                  then
                     word = word .. "~"
                  end
                  vim_item.abbr = word
                  return vim_item
               end,
            }),
         },
         window = {
            completion = {
               border = "rounded",
               winhighlight = "Normal:CmpNormal",
               scrollbar = false,
               max_width = 18,
               min_width = 15,
            },
            documentation = {
               winhighlight = "Normal:CmpDocNormal",
               border = "rounded",
               min_width = 20,
               max_height = 20,
               scrollbar = false,
            },
         },
      })
   end,
}
