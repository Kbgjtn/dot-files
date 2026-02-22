-- automatically refresh or recalculate folds when switching buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("normal! zx")
	end,
})

local function insert_at_cursor(text)
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	vim.api.nvim_buf_set_text(0, row, col, row, col, { text })
end

-- Build the dollar list string
local function make_dollar_list(n)
	n = tonumber(n) or 0
	if n <= 0 then
		vim.notify("Invalid number: " .. tostring(n), vim.log.levels.WARN)
		return
	end
	local parts = {}
	for i = 1, n do
		parts[i] = "$" .. i
	end
	local line = "(" .. table.concat(parts, ", ") .. ");"
	insert_at_cursor(line)
end

-- Command: :MakeDollarList [N]  (prompts if no arg)
vim.api.nvim_create_user_command("MakeDollarList", function(opts)
	local arg = opts.args
	if arg == "" then
		arg = vim.fn.input("How many placeholders? ")
	end
	make_dollar_list(tonumber(arg))
end, { nargs = "?" })

-- Keymap 1: <leader>md — prompt or use count (7<leader>md works)
vim.keymap.set("n", "<leader>md", function()
	local n = (vim.v.count > 0 and vim.v.count) or tonumber(vim.fn.input("How many placeholders? ")) or 0
	make_dollar_list(n)
end, { desc = "Insert ($1, $2, ...); inline — prompt or use count" })

-- Keymap 2: <leader>mD — require count (7<leader>mD)
vim.keymap.set("n", "<leader>mD", function()
	local n = vim.v.count > 0 and vim.v.count or 0
	if n == 0 then
		vim.notify("Provide a count, e.g. 7<leader>mD", vim.log.levels.WARN)
		return
	end
	make_dollar_list(n)
end, { desc = "Insert ($1..$N); inline using count (e.g. 7<leader>mD)" })
