return {
	{
		event = { "VeryLazy" },
		"tpope/vim-fugitive",
		"inkarkat/vim-ReplaceWithRegister",
		"tpope/vim-surround",
		"christoomey/vim-tmux-navigator",
	},

	{
		-- "Kbgjtn/coocobolo.nvim",
		dir = "/home/ozy/code/personal/lua/coocobolo.nvim",
		priority = 1,
	},

	-- {
	-- 	"andythigpen/nvim-coverage",
	-- 	event = "VeryLazy",
	-- 	rocks = { "lua-xmlreader" },
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("coverage").setup({
	-- 			signs = {
	-- 				covered = { hl = "CoverageCovered", text = "✔" },
	-- 				uncovered = { hl = "CoverageUncovered", text = "󱙝" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
