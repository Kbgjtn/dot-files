return {
   "nvim-lua/plenary.nvim",

   "github/copilot.vim",

   "christoomey/vim-tmux-navigator",

   "inkarkat/vim-ReplaceWithRegister",

   { "j-hui/fidget.nvim", opts = {} },

   "tpope/vim-surround",

   {
      "leoluz/nvim-dap-go",
      config = function()
         require("dap-go").setup()
      end,
   },

   {
      "rcarriga/nvim-dap-ui",
      dependecies = { "mfussenegger/nvim-dap" },
      config = function()
         require("dapui").setup()
      end,
   },

   {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
         require("nvim-dap-virtual-text").setup()
      end,
   },

   --[[ {
      dir = "/home/bono/Documents/.code/lua/coocobolo.nvim",
      config = function() end,
   }, ]]
}
