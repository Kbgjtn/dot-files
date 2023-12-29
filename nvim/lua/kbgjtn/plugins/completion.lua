local cmp = require("cmp")

local cm = cmp.mapping

cmp.setup({
	mapping = cm.preset.insert({
		["<C-b>"] = cm.scroll_docs(-4),
		["<C-f>"] = cm.scroll_docs(4),
		["<C-o>"] = cm.complete(),
		["<C-e>"] = cm.abort(),
		["<CR>"] = cm.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
