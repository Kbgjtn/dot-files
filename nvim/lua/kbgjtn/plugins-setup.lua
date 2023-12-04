-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- oil vim buffer filesystem
	use("stevearc/oil.nvim")

	-- undo tree
	use("mbbill/undotree")

	-- copilot
	use("github/copilot.vim")

	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- notify
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	})

	-- trouble nvim
	use("folke/trouble.nvim")

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- colorscheme
	-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	-- use("EdenEast/nightfox.nvim") -- nightfox colorscheme
	use("rebelot/kanagawa.nvim")
	-- use("https://github.com/rktjmp/lush.nvim")
	-- use("https://github.com/nocksock/bloop.nvim")
	-- use("rose-pine/neovim") -- rose pine colorscheme
	-- use("akinsho/horizon.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "catppuccin/nvim" })

	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")
	-- use("preservim/nerdcommenter")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-web-devicons" } })

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion

	-- lsp-zero
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

	-- managing & installing lsp servers, linters & formatters
	use({
		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
		"williamboman/mason-lspconfig.nvim",
	}) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("kylechui/nvim-surround")

	use("nvim-treesitter/nvim-treesitter-textobjects") -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	use("rhysd/vim-clang-format") -- https://github.com/rhysd/vim-clang-format

	-- golang stuff
	use({
		"ray-x/go.nvim",
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	})
	use("ray-x/guihua.lua")

	-- java plugin stuff
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-jdtls")

	use("nvim-lua/plenary.nvim")
	use("rafamadriz/friendly-snippets")

	-- python
	use("hkupty/iron.nvim")

	-- ollama gen.nvim
	use("david-kunz/gen.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
