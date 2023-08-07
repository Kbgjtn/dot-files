local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- keybindings
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
