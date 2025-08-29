return {
    {
        event = { "VeryLazy" },
        "tpope/vim-fugitive",
        "inkarkat/vim-ReplaceWithRegister",
        "tpope/vim-surround",
        "christoomey/vim-tmux-navigator",
        -- "nvim-focus/focus.nvim",
        -- "szw/vim-maximizer",
        -- "folke/zen-mode.nvim",
    },

    --[[ {
        "Kbgjtn/aw-watcher.nvim",
        opts = { -- required, but can be empty table: {}
            -- add any options here
            -- for example:
            aw_server = {
                host = "127.0.0.1",
                port = 5600,
            },
        },
    }, ]]

    --[[ {
        dir = "/home/oz31/code/personal/projects/aw-watcher.nvim",
        -- "Kbgjtn/coocobolo.nvim",

        opts = { -- required, but can be empty table: {}
            -- add any options here
            -- for example:
            aw_server = {
                host = "127.0.0.1",
                port = 5600,
            },
        },
        priority = 10,
    }, ]]

    --[[ {
      "jiaoshijie/undotree",
      event = "VeryLazy",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
         float_diff = false,
         position = "right",
         window = { winblend = 10 },
         layout = "left_left_bottom",
         ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
      },
      keys = { { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" } },
   }, ]]

    --[[ {
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
   }, ]]

    {
        "andythigpen/nvim-coverage",
        event = "VeryLazy",
        rocks = { "lua-xmlreader" },
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup({
                signs = {
                    covered = { hl = "CoverageCovered", text = "✔" },
                    uncovered = { hl = "CoverageUncovered", text = "󱙝" },
                },
            })
        end,
    },

    {
        -- dir = "<path_to_cocobolo.nvim>",
        "Kbgjtn/coocobolo.nvim",
        priority = 1,
    },
}
