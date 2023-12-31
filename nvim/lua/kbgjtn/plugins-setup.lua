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

	-- marks
	use("chentoast/marks.nvim")

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

	use({ "christoomey/vim-tmux-navigator" }) -- tmux & split window navigation

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

	-- tailwindcss
	use("roobert/tailwindcss-colorizer-cmp.nvim")

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

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	-- java plugin stuff
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-jdtls")

	use("nvim-lua/plenary.nvim")
	use("rafamadriz/friendly-snippets")

	-- python
	use("hkupty/iron.nvim")

	-- ollama gen.nvim
	use("david-kunz/gen.nvim")

	-- ufo
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- headlines
	use({
		"lukas-reineke/headlines.nvim",
		after = "nvim-treesitter",
	})

	use("leoluz/nvim-dap-go")

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- java-nvim

	use({
		"nvim-java/nvim-java",
		requires = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"mfussenegger/nvim-dap",
		},
	})

	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("hrsh7th/cmp-vsnip")
	use("williamboman/nvim-lsp-installer")

	-- twilight
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.45, -- amount of dimming
					-- we try to get the foreground from the highlight groups or fallback color
					color = { "Normal", "#ffffff" },
					inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
				},
				context = 16, -- amount of lines we will try to show around the current line
				treesitter = true, -- use treesitter when available for the filetype
				-- treesitter is used to automatically expand the visible text,
				-- but you can further control the types of nodes that should always be fully expanded
				expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
					"function",
					"method",
					"table",
					"if_statement",
					"import",
				},
				exclude = {}, -- exclude these filetypes
			})
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
