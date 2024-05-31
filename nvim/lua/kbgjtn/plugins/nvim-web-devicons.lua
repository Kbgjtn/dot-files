return {
   "nvim-tree/nvim-web-devicons",
   event = "VeryLazy",
   config = function()
      local icons = require("nvim-web-devicons")
      local colors = require("kbgjtn.config.highlight")

      icons.set_default_icon("󰈔", colors.dark.soft, 65)
      icons.setup({ color_icons = false, default = true })
      icons.set_icon({
         yml = { icon = "ξ", name = "Yaml" },
         yaml = { icon = "ξ", name = "Yaml" },
         gql = { icon = "", name = "GraphQL" },
         xmodmap = { icon = "", name = "Xmodmap" },
         favicon = { icon = "", name = "Favicon" },

         [".env"] = { icon = "", name = "Env" },
         ["go.mod"] = { icon = "", name = "Go" },
         ["go.sum"] = { icon = "", name = "Go" },
         [".env.local"] = { icon = "", name = "Env" },
         [".env.example"] = { icon = "", name = "Env" },
      })
   end,
}
