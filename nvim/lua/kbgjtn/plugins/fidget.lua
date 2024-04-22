return {
   "j-hui/fidget.nvim",
   config = function()
      local fidget = require("fidget")
      fidget.setup({
         progress = {
            poll_rate = 0,
            suppress_on_insert = false, -- Suppress new messages while in insert mode
            ignore_done_already = true, -- Ignore new tasks that are already complete
            ignore_empty_message = false, -- Ignore new tasks that don't contain a message
            clear_on_detach = function(client_id)
               local client = vim.lsp.get_client_by_id(client_id)
               return client and client.name or nil
            end,
            notification_group = function(msg)
               return msg.lsp_client.name
            end,
            display = {
               render_limit = 16, -- How many LSP messages to show at once
               done_ttl = 5, -- How long a message should persist after completion
               done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
               done_style = "Constant", -- Highlight group for completed LSP tasks
               progress_ttl = math.huge, -- How long a message should persist when in progress
               progress_icon = { pattern = "dots", period = 1 },
               progress_style = "WarningMsg",
               group_style = "Title", -- Highlight group for group name (LSP server name)
               icon_style = "Question", -- Highlight group for group icons
               priority = 30,
               skip_history = true,
               format_message = require("fidget.progress.display").default_format_message,
               format_annote = function(msg)
                  return msg.title
               end,
               format_group_name = function(group)
                  return tostring(group)
               end,
               overrides = { -- Override options from the default notification config
                  rust_analyzer = { name = "rust-analyzer" },
               },
            },
            lsp = {
               progress_ringbuf_size = 0,
            },
         },
         notification = {
            poll_rate = 10,
            filter = vim.log.levels.INFO,
            history_size = 128,
            override_vim_notify = true,
            configs = { default = require("fidget.notification").default_config },
            redirect = function(msg, level, opts)
               if opts and opts.on_open then
                  return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
               end
            end,
            view = {
               stack_upwards = true,
               icon_separator = " ",
               group_separator = "⋯ ⋯ ⋯ ⋯ ⋯ ⋯",
               group_separator_hl = "Comment",
               render_message = function(msg, cnt)
                  return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
               end,
            },
            window = {
               normal_hl = "Normal",
               winblend = 99,
               border = "none",
               zindex = 100,
               max_width = 0, -- Maximum width of the notification window
               max_height = 0, -- Maximum height of the notification window
               x_padding = 1, -- Padding from right edge of window boundary
               y_padding = 0, -- Padding from bottom edge of window boundary
               align = "bottom", -- How to align the notification window
               relative = "editor",
            },
         },
         logger = {
            level = vim.log.levels.INFO,
            float_precision = 0.01,
            path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
         },
      })
   end,
}
