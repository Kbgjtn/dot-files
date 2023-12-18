local status, webdev_icons = pcall(require, "nvim-web-devicons")

if not status then
	return
end

webdev_icons.set_default_icon("", "#6d8086", 65)
webdev_icons.setup({
	color_icons = true,
	default = true,
	strict = true,
	override = {
		file = {
			icon = "",
		},
	},
	override_by_filename = {
		[".env"] = {
			icon = "",
		},
		[".editorconfig"] = {
			icon = "",
		},
		[".prettierrc"] = {
			icon = "P",
		},
		[".eslintignore"] = {
			icon = "E",
		},
		[".prettierignore"] = {
			icon = "P",
		},
		[".nvimrc"] = {
			icon = "⌨",
		},
		[".czrc"] = {
			icon = "Z",
		},
	},

	override_by_extension = {
		["txt"] = {
			icon = "",
		},
		["yml"] = {
			icon = "Y",
		},
		["yaml"] = {

			icon = "Y",
		},
		["xml"] = {
			icon = "X",
		},
		["png"] = {
			icon = "",
		},
		["jpeg"] = {
			icon = "",
		},
		["jpg"] = {
			icon = "",
		},
		["gitignore"] = {
			icon = "",
		},
		["gitattributes"] = {
			icon = "",
		},
		["docker-compose.yml"] = {
			icon = "🐳",
		},
		["docker-compose-dev.yml"] = {
			icon = "🐳",
		},
		["dockerignore"] = {
			icon = "🐳",
		},
		["prettierrc"] = {
			icon = "⚙",
		},
		["prettierignore"] = {
			icon = "⚙",
		},

		["log"] = {
			icon = "",
		},
		["prisma"] = {
			icon = "◮",
		},
		["env"] = {
			icon = "",
		},
		["sample"] = {
			icon = "",
		},
		["example"] = {
			icon = "",
		},
		["prod"] = {
			icon = "",
		},
		["dev"] = {
			icon = "",
		},
		["local"] = {
			icon = "",
		},
		["sum"] = {
			icon = "",
		},
		["mod"] = {
			icon = "",
		},
		["sql"] = {
			icon = "",
		},
	},
})
