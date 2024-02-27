return {
   "nvim-telescope/telescope.nvim",
   branch = "0.1.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
         "nvim-telescope/telescope-fzf-native.nvim",
         build = "make",
      },
   },
   config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
         defaults = {
            path_display = { "truncate " },
            prompt_prefix = "→ ",
            selection_caret = "→ ",
            scroll_strategy = "limit",
            file_ignore_patterns = { ".git/*" },
            layout_strategy = "horizontal",
            preview_cutoff = 0,
            layout_config = {
               height = 0.50,
               width = 0.70,
            },
            mappings = {
               i = {
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
               },
            },
         },
         pickers = {
            find_files = {
               hidden = true,
            },
         },
      })

      telescope.load_extension("fzf")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      local telescope_builtin = require("telescope.builtin")

      keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
      keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
      keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
      keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

      keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
      keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
      keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
      keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
      keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>")

      keymap.set("n", "<leader>fm", function()
         telescope_builtin.marks(require("telescope.themes").get_dropdown({ previewer = false }))
      end)
      keymap.set("n", "<leader>/", function()
         telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
      end)
   end,
}
