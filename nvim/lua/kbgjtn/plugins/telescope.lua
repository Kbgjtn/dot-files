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
        local actions_layout = require("telescope.actions.layout")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                prompt_prefix = " → ",
                selection_caret = "  ",
                scroll_strategy = "limit",
                file_ignore_patterns = { ".git/*", "node_modules/*" },
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
                        ["<C-?>"] = actions_layout.toggle_preview,
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

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>")
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

        -- keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
        keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
        keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]
        keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")

        keymap.set("n", "<leader>fm", function()
            telescope_builtin.marks(require("telescope.themes").get_dropdown({ previewer = false }))
        end)
        keymap.set("n", "<leader>/", function()
            telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
        end)

        keymap.set("n", "<Leader><tab>", "<Cmd>Telescope Builtin<CR>", { noremap = false })
    end,
}
