vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- greatest vim keymap ever
keymap.set("n", "Q", "<Nop>")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<c-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<C-/>", "<cmd>Inspect<cr>")

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("n", "H", "0") -- first word
keymap.set("n", "L", "$") -- last word

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--  keymap.set("n", "<leader>f", vim.lsp.buf.format)
keymap.set("n", "<leader>e", ":LfCurrentFile<CR>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

-- save all buffer files
keymap.set("n", "<leader>w", ":wall<CR>")

-- cloack togle
keymap.set("n", "<leader>c", ":CloakToggle<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- increment/decrement numbers
keymap.set("n", "<C-i>", "<C-a>")
keymap.set("n", "<C-d>", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<M-l>", ":vertical resize +2<CR>")
keymap.set("n", "<M-h>", ":vertical resize -2<CR>")
keymap.set("n", "<M-K>", ":resize +2<CR>")
keymap.set("n", "<M-J>", ":resize -2<CR>")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

local opts = { noremap = true, silent = true }

-- bufferline
keymap.set("n", "<A-k>", ":bn<CR>", opts)
keymap.set("n", "<A-j>", ":bp<CR>", opts)
keymap.set("n", "<A-x>", ":BufferLinePickClose<CR>", opts)
keymap.set("n", "<C-q>", ":bdelete<CR>", opts)

-- stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- move selection text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

local telescope_builtin = require("telescope.builtin")

-- telescope
vim.keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>/", function()
   telescope_builtin.current_buffer_fuzzy_find(
      require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
   )
end)

vim.keymap.set("n", "<leader>fm", function()
   telescope_builtin.marks(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
   }))
end)

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>") -- find git files within current working directory
keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", opts)

-- dap
keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap.set(
   "n",
   "<leader>lp",
   "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
   opts
)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)
-- dap-ui
keymap.set("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<CR>", opts)
-- dap-go
--keymap.set("n", "<leader>dt", "<cmd>lua require'dap-go'.debug_test()<CR>", opts)
