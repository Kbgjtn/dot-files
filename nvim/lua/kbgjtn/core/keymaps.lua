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

-- save all buffer files
keymap.set("n", "<leader>w", ":wall<CR>")

-- undo tree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- tab buffer
keymap.set("n", "<A-K>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<A-J>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<A-X>", ":BufferLinePickClose<CR>")

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

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

local opts = { noremap = true, silent = true }

keymap.set("n", "<C-j>", "<Cmd>bn<CR>", opts)
keymap.set("n", "<C-k>", "<Cmd>bp<CR>", opts)

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

-- telescope
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
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", opts)

-- Ufo keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- trouble keymaps
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

local P = {}

-- key_mapping --
local key_map = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

--LSP
function P.map_lsp_keys()
	key_map("n", "<C-]>", ":lua vim.lsp.buf.definition()<CR>")
	key_map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
	key_map("n", "<S-R>", ":lua vim.lsp.buf.references()<CR>")
	key_map("n", "<S-H>", ":lua vim.lsp.buf.hover()<CR>")
	key_map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
	key_map("n", "<leader>nc", ":lua vim.lsp.buf.rename()<CR>")
	key_map("n", "<leader>fr", ':lua require"telescope.builtin".lsp_references()')
end

-- java
function P.map_java_keys()
	P.map_lsp_keys()
	key_map("n", "<leader>oi", ':lua require("jdtls").organize_imports()<CR>')
	key_map("n", "<leader>jc", ':lua require("jdtls).compile("incremental")')
end

return P
