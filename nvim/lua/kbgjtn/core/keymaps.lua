K = {}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

function K.on_attach(_, bufnr)
   opts.buffer = bufnr

   -- set keybinds
   opts.desc = "Show LSP references"
   keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

   opts.desc = "Go to declaration"
   keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

   opts.desc = "Show LSP definitions"
   keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

   opts.desc = "Show LSP implementations"
   keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

   opts.desc = "Show LSP type definitions"
   keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

   opts.desc = "See available code actions"
   keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

   opts.desc = "Smart rename"
   keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

   opts.desc = "Show buffer diagnostics"
   keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

   opts.desc = "Show line diagnostics"
   keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

   opts.desc = "Go to previous diagnostic"
   keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

   opts.desc = "Go to next diagnostic"
   keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

   opts.desc = "Show documentation for what is under cursor"
   keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

   opts.desc = "Restart LSP"
   keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

-- greatest vim keymap ever
keymap.set("n", "Q", "<Nop>")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<c-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<C-/>", "<cmd>Inspect<cr>")

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--[[ keymap.set({ "n", "v" }, "H", "0") -- first word
keymap.set({ "n", "v" }, "L", "$") -- last word ]]

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--  keymap.set("n", "<leader>f", vim.lsp.buf.format)
keymap.set("n", "<leader>e", ":LfCurrentFile<CR>")

keymap.set({ "v", "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])
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
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<M-K>", ":resize +2<CR>")
keymap.set("n", "<M-J>", ":resize -2<CR>")
keymap.set("n", "<M-l>", ":vertical resize +2<CR>")
keymap.set("n", "<M-h>", ":vertical resize -2<CR>")

-- Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")
keymap.set("n", "<Space>", "<C-w>w")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- bufferline
keymap.set("n", "<A-k>", ":bn<CR>", opts)
keymap.set("n", "<A-j>", ":bp<CR>", opts)
keymap.set("n", "<C-q>", ":bdelete<CR>", opts)

-- stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- move selection text up and down
keymap.set("v", "p", '"_dP', opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", opts)
