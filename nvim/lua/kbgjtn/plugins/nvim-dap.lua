return {
   {
      "mfussenegger/nvim-dap",
      config = function()
         local dap = require("dap")

         dap.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
               command = "dlv",
               args = { "dap", "-l", "127.0.0.1:${port}" },
               -- add this if on windows, otherwise server won't open successfully
               -- detached = false
            },
         }

         -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
         dap.configurations.go = {
            {
               type = "delve",
               name = "Debug",
               request = "launch",
               program = "${file}",
            },
            {
               type = "delve",
               name = "Debug test", -- configuration for debugging test files
               request = "launch",
               mode = "test",
               program = "${file}",
            },
            -- works with go.mod packages and sub packages
            {
               type = "delve",
               name = "Debug test (go.mod)",
               request = "launch",
               mode = "test",
               program = "./${relativeFileDirname}",
            },
         }

         --[[          vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" }) ]]
         vim.fn.sign_define("DapStopped", { text = "▢", texthl = "", linehl = "", numhl = "" })

         require("dap.ext.vscode").load_launchjs(nil, {})
      end,
   },

   {
      "rcarriga/nvim-dap-ui",
      dependecies = {
         "nvim-neotest/nvim-nio",
         "mfussenegger/nvim-dap",
      },
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
            element_mappings = {},
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
      config = function()
         require("dap-go").setup({
            -- Additional dap configurations can be added.
            -- dap_configurations accepts a list of tables where each entry
            -- represents a dap configuration. For more details do:
            -- :help dap-configuration
            dap_configurations = {
               {
                  -- Must be "go" or it will be ignored by the plugin
                  type = "go",
                  name = "Attach remote",
                  mode = "remote",
                  request = "attach",
               },
            },
            -- delve configurations
            delve = {
               -- the path to the executable dlv which will be used for debugging.
               -- by default, this is the "dlv" executable on your PATH.
               path = "dlv",
               -- time to wait for delve to initialize the debug session.
               -- default to 20 seconds
               initialize_timeout_sec = 20,
               -- a string that defines the port to start delve debugger.
               -- default to string "${port}" which instructs nvim-dap
               -- to start the process in a random available port
               port = "${port}",
               -- additional args to pass to dlv
               args = {},
               -- the build flags that are passed to delve.
               -- defaults to empty string, but can be used to provide flags
               -- such as "-tags=unit" to make sure the test suite is
               -- compiled during debugging, for example.
               -- passing build flags using args is ineffective, as those are
               -- ignored by delve in dap mode.
               build_flags = "",
               -- whether the dlv process to be created detached or not. there is
               -- an issue on Windows where this needs to be set to false
               -- otherwise the dlv server creation will fail.
               detached = true,
               -- the current working directory to run dlv from, if other than
               -- the current working directory.
               cwd = nil,
            },
         })
      end,
   },
}
