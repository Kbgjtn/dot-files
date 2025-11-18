K = {}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
local opts = {
    noremap = true,
    silent = true,
}

keymap.set("n", "Q", "<Nop>")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<S-j>", "mzJ`z")
keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<S-u>", "<C-u>zz")
keymap.set("n", "<C-/>", "<cmd>Inspect<cr>", { desc = "inspect treesitter semantic tokens" })
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set({ "v", "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- save all buffer files
keymap.set("n", "<leader>w", ":wall<CR>")

-- cloack togle
-- keymap.set("n", "<leader>cl", ":CloakToggle<CR>")

-- vim.keymap.set("n", "n", "h", { noremap = true }) -- Map n to h (move left)
-- vim.keymap.set("n", "e", "j", { noremap = true }) -- Map e to j (move down)
-- vim.keymap.set("n", "u", "k", { noremap = true }) -- Map u to k (move up)
-- vim.keymap.set("n", "a", "l", { noremap = true }) -- Map a to l (move right)

vim.keymap.set("t", "<C-d>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { noremap = true })

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sq", ":close<CR>")

-- resize vertical & horizontal window
keymap.set("n", "<M-K>", ":resize +2<CR>")
keymap.set("n", "<M-J>", ":resize -2<CR>")
keymap.set("n", "<M-l>", ":vertical resize +2<CR>")
keymap.set("n", "<M-h>", ":vertical resize -2<CR>")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- bufferline
keymap.set("n", "<A-k>", ":bn<CR>", opts)
keymap.set("n", "<A-j>", ":bp<CR>", opts)
keymap.set("n", "<A-q>", ":bp | bd #<CR>", opts)

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
-- keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

local function toggle_numbering()
    local is_relative = vim.api.nvim_get_option_value("relativenumber", { scope = "global" })
    local new_value = not is_relative

    -- Update global defaults
    vim.opt.number = new_value
    vim.opt.relativenumber = new_value
    vim.opt.cursorline = new_value

    -- Highlight
    vim.api.nvim_set_hl(
        0,
        "LineNr",
        is_relative and { fg = "#101010", bg = "#000000" } or { fg = "#202020", bg = "#000000" }
    )

    -- Update each window's local options
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        vim.api.nvim_set_option_value("number", new_value, { scope = "local", win = win })
        vim.api.nvim_set_option_value("relativenumber", new_value, { scope = "local", win = win })
        vim.api.nvim_set_option_value("cursorline", new_value, { scope = "local", win = win })
    end
end

keymap.set("n", "<leader>nc", toggle_numbering, { desc = "toggle relative/absolute line numbering" })

local function coverageToggle()
    vim.cmd("CoverageLoad")
    vim.cmd("CoverageToggle")
end

keymap.set("n", "<leader>cc", coverageToggle, { desc = "load test coverage" })
keymap.set("n", "<leader>co", "<cmd>CoverageToggle<cr>", { desc = "toggle show coverage" })
keymap.set("n", "<leader>cs", "<cmd>CoverageSummary<cr>", { desc = "toggle coverage summary" })

-- keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", opts)
-- keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", opts)
-- keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
-- keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", opts)

-- keymap.set("n", "-", "<cmd>Explore<cr>", opts)

-- gitsigns
vim.keymap.set("n", "<leader>gd", function()
    require("gitsigns").preview_hunk()
end, opts)

vim.keymap.set("n", "<leader>gg", function()
    require("gitsigns").toggle_current_line_blame()
end, opts)

-- nvim-dap
-- vim.keymap.set("n", "<leader>do", function()
-- 	require("dap").continue()
-- end)
-- vim.keymap.set("n", "<F10>", function()
-- 	require("dap").step_over()
-- end)
-- vim.keymap.set("n", "<F11>", function()
-- 	require("dap").step_into()
-- end)
-- vim.keymap.set("n", "<F12>", function()
-- 	require("dap").step_out()
-- end)
-- vim.keymap.set("n", "<leader>b", function()
-- 	require("dap").toggle_breakpoint()
-- end)
-- vim.keymap.set("n", "<leader>dr", function()
-- 	require("dap").repl.open()
-- end)
-- vim.keymap.set("n", "<leader>dl", function()
-- 	require("dap").run_last()
-- end)
-- vim.keymap.set({ "n", "v" }, "<leader>dh", function()
-- 	require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<leader>dp", function()
-- 	require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<leader>df", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<leader>ds", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)
--
-- vim.keymap.set("n", "<leader>df", function()
-- 	require("dap-go").debug_test()
-- end)

-- neotest
-- vim.keymap.set("n", "<leader>rt", function()
-- 	require("neotest").run.run()
-- end, opts)
--
-- vim.keymap.set("n", "<leader>st", function()
-- 	require("neotest").run.stop()
-- end, opts)
--
-- vim.keymap.set("n", "<leader>oo", function()
-- 	require("neotest").output.open()
-- end, opts)
--
-- vim.keymap.set("n", "<leader>tt", function()
-- 	require("neotest").summary.toggle()
-- end, opts)
--
-- vim.keymap.set("n", "<leader>t.", function()
-- 	require("neotest").run.run(vim.fn.expand("%"))
-- end, opts)
--
-- vim.keymap.set("n", "<leader>to", function()
-- 	require("neotest").output_panel.toggle()
-- end, opts)
--
-- vim.keymap.set("n", "<leader>tw", function()
-- 	require("neotest").watch.toggle(vim.fn.expand("%"))
-- end, opts)
--
-- vim.keymap.set("n", "<leader>ta", function()
-- 	require("neotest").run.attach()
-- end, opts)
