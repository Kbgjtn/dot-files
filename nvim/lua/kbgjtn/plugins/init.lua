return {
   "nvim-lua/plenary.nvim",

   "christoomey/vim-tmux-navigator",

   "inkarkat/vim-ReplaceWithRegister",

   "tpope/vim-surround",

   {
      "jiaoshijie/undotree",
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      opts = {
         float_diff = false, -- using float window previews diff, set this `true` will disable layout option
         layout = "left_left_bottom", -- "left_bottom", "left_left_bottom"
         position = "right", -- "right", "bottom"
         ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
         window = {
            winblend = 10,
         },
      },
      keys = {
         { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
      },
   },

   {
      "folke/zen-mode.nvim",
      opts = {
         window = { width = 0.90 },
         plugins = {
            kitty = { enabled = true, font = "+12" },
            fidget = { enabled = false },
         },
      },
      keys = { { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
   },

   -- { "nvim-focus/focus.nvim", event = "VeryLazy", opts = {} },

   {
      "szw/vim-maximizer",
      event = "VeryLazy",
      keys = {
         { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
      },
   },

   {
      "max397574/better-escape.nvim",
      config = function()
         require("better_escape").setup({
            timeout = vim.o.timeoutlen,
            mappings = {
               i = {
                  j = {
                     -- These can all also be functions
                     k = "<Esc>",
                     j = "<Esc>",
                  },
               },
               c = {
                  j = {
                     k = "<Esc>",
                     j = "<Esc>",
                  },
               },
               t = {
                  j = {
                     k = "<Esc>",
                     j = "<Esc>",
                  },
               },
               v = {
                  j = {
                     k = "<Esc>",
                  },
               },
               s = {
                  j = {
                     k = "<Esc>",
                  },
               },
            },
         })
      end,
   },

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
         vim.o.timeout = true
         vim.o.timeoutlen = 500
      end,
   },

   {
      "nvim-neotest/neotest",
      event = "VeryLazy",
      dependencies = {
         "antoinemadec/FixCursorHold.nvim",
         "nvim-neotest/neotest-go",
         "nvim-neotest/nvim-nio",
      },
      config = function()
         require("neotest").setup({ adapters = { require("neotest-go") } })
      end,
   },

   {
      dir = "~/Documents/.code/lua/coocobolo.nvim",
      config = true,
      event = "VeryLazy",
      priority = 100000,
   },
}
