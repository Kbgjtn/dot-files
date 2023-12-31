local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
	return
end

-- configure autopairs
autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" }, -- don't add pairs in lua string treesitter nodes
		javascript = { "string", "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		php = { "string", "template_string" }, -- don't add pairs in php template_string treesitter nodes
	},
	disable__filetype = { "TelescopePrompt", "spectre_panel" }, -- don't add pairs in TelescopePrompt
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'", "`", "```" },
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		hightlight_grey = "LineNr",
	},
})

local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
	return
end

local cmp_setup, cmp = pcall(require, "cmp")

if not cmp_setup then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
