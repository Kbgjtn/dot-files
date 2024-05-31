return {
   "stevearc/oil.nvim",
   config = function()
      require("oil").setup({
         columns = { "icon", "size" },
         buf_options = {
            buflisted = false,
            bufhidden = "",
         },
         win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            relativenumber = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
         },
         default_file_explorer = true,
         delete_to_trash = true,
         prompt_delete_on_select_new_entry = false,
         prompt_save_on_select_new_entry = false,
         restore_win_options = true,
         skip_confirm_for_simple_edits = true,
         use_default_keymaps = true,
         keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
         },
         float = {
            padding = 0,
            max_width = 50,
            max_height = 20,
            border = "rounded",
            win_options = { winblend = 10 },
            override = function(conf)
               return conf
            end,
         },
         preview = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            win_options = { winblend = 0 },
         },
         progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = { winblend = 0 },
         },
         view_options = {
            show_hidden = true,
            sort = {
               { "type", "asc" },
               { "name", "asc" },
            },
         },
      })

      vim.keymap.set("n", "-", require("oil").open, { desc = "open parent directory in oil" })
      vim.keymap.set("n", "<leader>e", require("oil").open_float, { desc = "open parent directory in oil" })
   end,
}
