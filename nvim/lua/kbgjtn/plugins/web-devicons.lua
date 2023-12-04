require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true,
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "gitignore",
		},
		[".eslintignore"] = {
			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
		["docker-compose.yml"] = {
			icon = "🐳",
			color = "#f1502f",
			name = "Dockercompos",
		},
		["docker-compose-dev.yml"] = {
			icon = "🐳",
			color = "#f1502f",
			name = "Dockercompos",
		},
		[".dockerignore"] = {
			icon = "🐳",
			color = "#f1502f",
			name = "dockerignore",
		},
		[".prettierrc"] = {
			icon = "⚙",
			color = "#f3f3f3",
			name = "dockerignore",
		},
		[".prettierignore"] = {
			icon = "⚙",
			color = "#f3f3f3",
			name = "dockerignore",
		},
		[".czrc"] = {
			icon = "⚙",
			color = "#81e043",
			name = "Log",
		},
		[".nvimrc"] = {
			icon = "⌨",
			color = "#f3f3f3",
			name = "dockerignore",
		},
	},
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
		["txt"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
		["prisma"] = {
			icon = "◮",
			color = "#81e043",
			name = "Log",
		},
		["env"] = {
			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
		["sample"] = {
			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
		["prod"] = {
			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
		["dev"] = {
			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
		["local"] = {

			icon = "⚙",
			color = "#f1502f",
			name = "gitignore",
		},
	},
})
