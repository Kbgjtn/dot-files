local cmp = require("cmp")

local cm = cmp.mapping

cmp.setup({
	mapping = cm.preset.insert({
		-- <Tab> and <S-Tab> to navigate through popup menu
		-- "<Tab>": cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- "<S-Tab>": cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- "<CR>": cmp.mapping.confirm({ select = true }),
		-- "<C-Space>": cmp.mapping.complete(),
		-- "<C-e>": cmp.mapping.close(),
		-- "<C-f>": cmp.mapping.scroll_docs(-4),
		-- "<C-d>": cmp.mapping.scroll_docs(4),
		-- "<C-u>": cmp.mapping.scroll_docs(-4),
		-- "<C-b>": cmp.mapping.scroll_docs(4),
		-- "<C-y>": cmp.mapping.confirm({ select = true }),
		-- "<C-n>": cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- "<C-p>": cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		-- "<C-Space>": cmp.mapping.complete(),
		-- "<C-e>": cmp.mapping.close(),
		-- "<C-f>": cmp.mapping.scroll_docs(-4),
		-- "<C-d>": cmp.mapping.scroll_docs(4),
		-- "<C-u>": cmp.mapping.scroll_docs(-4),
		-- "<C-b>": cmp.mapping.scroll_docs(4),
		-- "<C-y>": cmp.mapping.confirm({ select = true }),
		-- "<C-n>": cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- "<C-p>": cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		-- "<C-Space>": cmp.mapping.complete(),
		-- "<C-e>": cmp.mapping.close(),
		-- "<C-f>": cmp.mapping.scroll_docs(-4),
		-- "<C-d>": cmp.mapping.scroll_docs(4),
		-- "<C-u>": cmp.mapping.scroll_docs(-4),
		-- "<C-b>": cmp.mapping.scroll_docs(4),
		-- "<C-y>": cmp.mapping.confirm({ select = true }),
		-- "<C-n>": cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- "<C-p>": cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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
