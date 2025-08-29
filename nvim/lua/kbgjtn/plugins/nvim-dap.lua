return {
   --[[ {
      "mfussenegger/nvim-dap",
      event = { "VeryLazy" },
      config = function()
         local dap = require("dap")

         dap.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
               command = "dlv",
               args = { "dap", "-l", "127.0.0.1:${port}" },
            },
         }

         dap.configurations.go = {
            {
               type = "delve",
               name = "Debug",
               request = "launch",
               program = "${file}",
            },
            {
               type = "delve",
               name = "Debug test",
               request = "launch",
               mode = "test",
               program = "${file}",
            },
            {
               type = "delve",
               name = "Debug test (go.mod)",
               request = "launch",
               mode = "test",
               program = "./${relativeFileDirname}",
            },
         }

         -- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
         vim.fn.sign_define("DapStopped", { text = "▢", texthl = "", linehl = "", numhl = "" })
      end,
   },

   {
      "rcarriga/nvim-dap-ui",
      dependecies = {
         "nvim-neotest/nvim-nio",
         "mfussenegger/nvim-dap",
      },
      event = { "VeryLazy" },
      config = function()
         local dap, dapui = require("dap"), require("dapui")
         dapui.setup({
            controls = {
               element = "repl",
               enabled = true,
               icons = {
                  disconnect = "",
                  pause = "",
                  play = "",
                  run_last = "",
                  step_back = "",
                  step_into = "",
                  step_out = "",
                  step_over = "",
                  terminate = "▢",
               },
            },
            expand_lines = true,
            floating = {
               border = "single",
               mappings = {
                  close = { "q", "<Esc>" },
               },
            },
            force_buffers = true,
            icons = {
               collapsed = "",
               current_frame = "",
               expanded = "",
            },
            layouts = {
               {
                  elements = {
                     {
                        id = "scopes",
                        size = 0.25,
                     },
                     {
                        id = "breakpoints",
                        size = 0.25,
                     },
                     {
                        id = "stacks",
                        size = 0.25,
                     },
                     {
                        id = "watches",
                        size = 0.25,
                     },
                  },
                  position = "left",
                  size = 40,
               },
               {
                  elements = {
                     {
                        id = "repl",
                        size = 0.5,
                     },
                     {
                        id = "console",
                        size = 0.5,
                     },
                  },
                  position = "bottom",
                  size = 10,
               },
            },
            mappings = {
               edit = "e",
               expand = { "<CR>", "<2-LeftMouse>" },
               open = "o",
               remove = "d",
               repl = "r",
               toggle = "t",
            },
            render = {
               indent = 1,
               max_value_lines = 100,
            },
         })

         dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
         end
         dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
         end
         dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
         end
      end,
   },

   {
      "leoluz/nvim-dap-go",
      event = { "VeryLazy" },
      config = function()
         require("dap-go").setup({
            dap_configurations = {
               {
                  type = "go",
                  name = "Attach remote",
                  mode = "remote",
                  request = "attach",
               },
            },

            delve = {
               path = "dlv",
               initialize_timeout_sec = 20,
               port = "${port}",
               args = {},
               build_flags = "",
               detached = true,
               cwd = nil,
            },
         })
      end,
   }, ]]
}
