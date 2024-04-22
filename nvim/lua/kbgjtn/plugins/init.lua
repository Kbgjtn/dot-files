return {
   "nvim-lua/plenary.nvim",

   "github/copilot.vim",

   "christoomey/vim-tmux-navigator",

   "inkarkat/vim-ReplaceWithRegister",

   "tpope/vim-surround",

   {
      "nvim-neotest/neotest",
      dependencies = {
         "antoinemadec/FixCursorHold.nvim",
         "nvim-neotest/neotest-go",
         "nvim-neotest/nvim-nio",
      },
      config = function()
         require("neotest").setup({
            adapters = {
               require("neotest-go"),
            },
         })
      end,
   },

   {
      dir = "~/Documents/.code/lua/coocobolo.nvim",
      config = true,
      priority = 100000,
      opts = {
         default_background = false,
         dim_inactive = false,
         styles = {
            comments = {
               bold = false,
               italic = false,
            },
            functions = {
               bold = true,
               italic = false,
            },
            keywords = {
               bold = true,
               italic = false,
            },
            variables = {
               bold = false,
               italic = false,
            },
         },
         terminal_colors = true,
         theme = "dark",
         transparent = false,
      },
   },
}
