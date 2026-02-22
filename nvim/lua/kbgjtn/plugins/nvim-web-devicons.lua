return {
	"nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		local icons = require("nvim-web-devicons")

		icons.set_default_icon("", "#606060", 100)

		icons.setup({
			color_icons = false,
			default = true,
			override_by_filename = {
				["oil"] = {
					icon = "",
					name = "Oil",
				},
			},
		})

		icons.set_icon({
			yml = { icon = "ξ", name = "Yaml" },
			out = { icon = "", name = "Yaml" },
			yaml = { icon = "ξ", name = "Yaml" },
			gql = { icon = "", name = "GraphQL" },
			xmodmap = { icon = "", name = "Xmodmap" },
			desktop = { icon = "", name = "desktop" },
			favicon = { icon = "", name = "Favicon" },

			[".env"] = { icon = "", name = "Env" },
			["go.mod"] = { icon = "", name = "Go" },
			["go.sum"] = { icon = "", name = "Go" },
			[".env.local"] = { icon = "", name = "Env" },
			[".env.example"] = { icon = "", name = "Env" },
		})
	end,
}
