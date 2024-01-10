return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local icons = require("nvim-web-devicons")
    local colors = require("kbgjtn.core.highlight")
    icons.set_default_icon("", colors.dark.softest, 65)
    icons.setup({
      color_icons = false,
      default = true,
    })

    icons.set_icon({
      gql = {
        icon = "",
        cterm_color = "199",
        name = "GraphQL",
      },
    })
  end,
}
