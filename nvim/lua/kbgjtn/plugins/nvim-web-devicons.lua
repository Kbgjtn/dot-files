return {
   "nvim-tree/nvim-web-devicons",
   config = function()
      local icons = require("nvim-web-devicons")
      local colors = require("kbgjtn.core.highlight")
      icons.set_default_icon("", colors.dark.soft, 65)

      icons.setup({
         color_icons = false,
         default = true,
      })

      icons.set_icon({
         gql = {
            icon = "",
            name = "GraphQL",
         },
         yml = {
            icon = "ξ",
            name = "Yaml",
         },
         yaml = {
            icon = "ξ",
            name = "Yaml",
         },
         favicon = {
            icon = "",
            name = "Favicon",
         },
         [".env"] = {
            icon = "",
            name = "Env",
         },
         [".env.local"] = {
            icon = "",
            name = "Env",
         },
         [".env.example"] = {
            icon = "",
            name = "Env",
         },
         ["go.mod"] = {
            icon = "",
            name = "Go",
         },
         ["go.sum"] = {
            icon = "",
            name = "Go",
         },
         xmodmap = {
            icon = "",
            name = "Xmodmap",
         },
      })
   end,
}
