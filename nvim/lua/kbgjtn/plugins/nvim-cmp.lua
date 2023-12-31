local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")

if not luasnip_status then
	return
end

luasnip.filetype_extend("typescriptreact", { "html" })

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

require("tailwindcss-colorizer-cmp").setup({
	color_square_width = 2,
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			border = "",
			winhighlight = "Normal:CmpNormal",
			scrollbar = false,
		},
		documentation = {
			winhighlight = "Normal:CmpDocNormal",
			border = "",
			min_width = 40,
			scrollbar = true,
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-h>"] = function()
			if cmp.visible_docs() then
				cmp.close_docs()
			else
				cmp.open_docs()
			end
		end,
	}),

	-- sources for autocompletion
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]

				if ctx.prev_context.filetype == "markdown" then
					return true
				end

				if kind == "Text" then
					return false
				end

				return true
			end,
		},
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		view = {
			entries = {
				name = "custom",
				selection_order = "top_down",
			},
			docs = {
				auto_open = false,
				min_width = 40,
				border = "rounded",
			},
			window = {
				completion = {
					max_width = 30,
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
				},
			},
		},
	}),

	formatting = {
		fields = { "kind", "abbr" },
		format = lspkind.cmp_format({
			mode = "symbol_text",
			nvim_lsp = "[LSP]",
			luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
			max_width = 40,
			ellipsis_char = "...",
			latex_symbols = "[Latex]",
			before = function(_, vim_item)
				return vim_item
			end,
			menu = {
				nvim_lsp = "[LSP]",
				ultisnips = "[US]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
				omni = "[Omni]",
			},
		}),
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})
