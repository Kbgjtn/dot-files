return {
   {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "L3MON4D3/LuaSnip",
         "saadparwaiz1/cmp_luasnip",
         "rafamadriz/friendly-snippets",
         "onsails/lspkind.nvim",
      },
      config = function()
         local cmp = require("cmp")
         local luasnip = require("luasnip")
         local lspkind = require("lspkind")

         require("luasnip.loaders.from_vscode").lazy_load()
         luasnip.filetype_extend("typescriptreact", { "html" })
         luasnip.filetype_extend("templ", { "htmx" })
         luasnip.filetype_extend("proto", { "proto" })

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
               ["<C-k>"] = cmp.mapping.select_prev_item(),
               ["<C-j>"] = cmp.mapping.select_next_item(),
               ["<C-b>"] = cmp.mapping.scroll_docs(),
               ["<C-f>"] = cmp.mapping.scroll_docs(),
               ["<C-Space>"] = cmp.mapping.complete({}),
               ["<C-e>"] = cmp.mapping.abort(),
               ["<CR>"] = cmp.mapping.confirm({ select = false }),
               ["<Tab>"] = cmp.mapping.confirm({ select = false }),
               ["<C-q>"] = function()
                  if cmp.visible_docs() then
                     cmp.close_docs()
                  else
                     cmp.open_docs()
                  end
               end,
            }),
            sources = cmp.config.sources({
               { name = "luasnip" },
               { name = "nvim_lsp" },
               { name = "lspkind" },
               { name = "path" },
               {
                  name = "buffer",
                  option = {
                     get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                     end,
                  },
               },
               view = {
                  entries = {
                     name = "custom",
                     selection_order = "top_down",
                  },
                  docs = {
                     auto_open = false,
                     max_width = 8,
                     min_width = 4,
                     border = "rounded",
                  },
                  window = {
                     completion = {
                        max_width = 28,
                        min_width = 8,
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                        scrollbar = false,
                        scrolloff = 8,
                     },
                     documentation = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
                        max_width = 12,
                        min_width = 8,
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
                        nvim_lsp = "",
                        nvim_lua = "",
                        treesitter = "",
                        path = "ܨ",
                        buffer = "󰕸",
                        zsh = "",
                        vsnip = "",
                        spell = "󰓆",
                        luasnip = "",
                        lspkind = "󰅪",
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
                  max_width = 20,
                  min_width = 4,
               },
               documentation = {
                  winhighlight = "Normal:CmpDocNormal",
                  border = "rounded",
                  min_width = 4,
                  max_height = 12,
                  scrollbar = false,
               },
            },
         })
      end,
   },

   {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      version = "v2.*",
      dependencies = "rafamadriz/friendly-snippets",
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load()
      end,
   },
}
