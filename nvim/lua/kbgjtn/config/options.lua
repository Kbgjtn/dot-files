-- vim.scriptencoding = "utf-8"

vim.loader.enable()

vim.o.winborder = "rounded"

local home = os.getenv("HOME")
local o = vim.opt
local g = vim.g

vim.filetype.add({
	extension = {
		templ = "templ",
		proto = "proto",
		md = "markdown",
		mdx = "markdown",
		env = "env",
		sql = "sql",
	},
})

vim.g.deprecation_warnings = false

g.vim_markdown_math = 1
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0
g.lazyvim_rust_diagnostics = "rust-analyzer"

g.go_def_mode = "gopls"
g.go_info_mode = "gopls"
g.go_fmt_command = "gopls"
g.go_gopls_gofumpt = 1

g.copilot_assume_mapped = false
g.copilot_filetypes = {
	markdown = false,
	yaml = false,
	json = false,
	gitcommit = false,
	templ = false,
}

-- disable unused stuff
-- g.loaded = 0
-- g.loaded_netrw = 0
-- g.loaded_netrwPlugin = 0
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1 -- use vim-matchup
g.loaded_matchparen = 1 -- use vim-matchup
-- g.netrw_list_hide = 1
-- g.netrw_hide = 1
g.completeopt = { "menu", "menuone", "noselect" }
g.netrw_keepdir = 1
-- g.netrw_liststyle = 0
g.netrw_banner = 0
g.netrw_clipboard = 0
-- g.netrw_altv = 1
g.root_spec = { "cwd" }

o.syntax = "on"
vim.o.shell = "/bin/sh"
o.hidden = true

vim.g.terminal_emulator = "/bin/sh"
-- Pmenusell to transparancy
-- o.pumblend = 15

o.conceallevel = 0
o.mouse = "a"
--o.encoding = "utf-8"
--o.fileencoding = "utf-8"
o.hlsearch = true
o.incsearch = true
o.smartindent = true
o.showcmd = true
o.cmdheight = 1

o.equalalways = false
o.laststatus = 0
o.statusline = "%f %y %m %= %l:%c %p%%"
function Statusline()
	local file = vim.fn.expand("%:t")
	local count = vim.fn.line("$")
	return "%#StatusLine#  " .. file .. "  %=%#StatusLineNC# " .. count .. " lines "
end
o.statusline = "%!v:lua.Statusline()"

o.scrolloff = 0
o.scroll = 5
o.sidescrolloff = 8
o.shell = "bash"
o.backupskip = { "/tmp/*", "/private/tmp/*" }
o.inccommand = "split"
o.smarttab = true
o.backspace = { "start", "eol", "indent" }
o.path:append({ "*.*" })
o.wildoptions:append({ "pum", "tagfile" })
o.pumheight = 6
o.pumwidth = 2
o.wildignore:append({ "*/node_modules/*" })
o.cursorcolumn = false
o.isfname:append("@-@")
o.updatetime = 1000
o.startofline = true
o.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
	foldsep = " ",
	fold = " ",
	foldopen = "󰍵",
	foldclose = "󰐖",
	eob = " ",
}

function FoldText()
	local line = vim.fn.getline(vim.v.foldstart)
	local count = vim.v.foldend - vim.v.foldstart + 1

	-- get indent width (count spaces/tabs)
	local indent_width = vim.fn.indent(vim.v.foldstart)

	-- pad with spaces equal to indent width
	local padding = string.rep(" ", indent_width)

	-- strip leading whitespace from content
	local content = line:gsub("^%s*", "")

	return padding .. " " .. content .. " (" .. count .. " lines)"
end

o.foldtext = "v:lua.FoldText()"

o.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

o.guicursor = {
	"i-ci-ve:ver85-Cursor/lCursor",
	"n-v-c:block-Cursor/lCursor",
	"i-ci-ve:ver25-Cursor/lCursor",
	"r-cr:hor20-Cursor/lCursor",
	"o:hor50-Cursor/lCursor",
	"a:blinkwait200-blinkoff150-blinkon150-Cursor/lCursor",
}

-- wait time
-- opt.timeout = false
o.timeoutlen = 300
o.ttimeout = true
o.ttimeoutlen = 100

o.syntax = "on" -- syntax highlighting

-- display
o.showmatch = true -- show matching brackets
o.synmaxcol = 169 -- stop syntax highlight after x lines for performance

o.list = false -- do not display white characters
o.foldenable = true -- do not enable folding by default
o.foldlevel = 2
o.foldmethod = "expr" -- fold based on syntax level
o.foldlevelstart = 69
o.foldcolumn = "0" -- show fold column when there are folds
o.foldexpr = "nvim_treesitter#foldexpr()"
o.eol = false -- show if there's no eol char
o.showbreak = "↳ " -- show this when line is broken
o.modelines = 0

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
o.formatoptions:append({
	"r",
})

--vim.opt.spell = true
--vim.opt.spelllang = "en_us"

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)
vim.wo.number = true

-- tabs & indentation
o.tabstop = 3 -- 3 spaces for tabs (prettier default)
o.softtabstop = 3
o.shiftwidth = 3 -- 3 spaces for indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one
o.cindent = true
o.textwidth = 200 -- wrap lines at 80 characters
o.splitbelow = true
o.splitright = true
o.breakindent = true
o.showbreak = string.rep(" ", 3)

o.compatible = false -- required for syntax highlighting to work properly

-- line wrapping
o.wrap = false -- disable line wrapping
o.linebreak = true

o.showtabline = 2

function get_git_branch(bufnr)
	-- prefer gitsigns if available
	local branch = vim.b[bufnr] and vim.b[bufnr].gitsigns_head or ""

	if branch == "" then
		local dir = vim.fn.expand("%:p:h")
		-- check if directory is a git repo
		local is_git = vim.fn.systemlist("git -C " .. dir .. " rev-parse --is-inside-work-tree")[1]
		if is_git == "true" then
			local git_branch = vim.fn.systemlist("git -C " .. dir .. " branch --show-current")[1]
			if git_branch and git_branch ~= "" then
				branch = git_branch
			end
		end
	end

	return branch
end
-- table of custom filetype icons
local ft_icons = {
	oil = { icon = "", hl = "DevIconOil" },
	fzf = { icon = "", hl = "DevIconFzf" },
	mason = { icon = "", hl = "DevIconMason" },
	checkhealth = { icon = "󰿘", hl = "DevIconCheckhealth" },
}

local function get_icon_for_buf(bufnr)
	local ft = vim.bo[bufnr].filetype
	local entry = ft_icons[ft]

	if entry then
		return entry.icon, entry.hl
	else
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
		local ext = vim.fn.fnamemodify(name, ":e")
		return require("nvim-web-devicons").get_icon(name, ext, { default = true })
	end
end

function Bufferline()
	local current_buf = vim.api.nvim_get_current_buf()
	local listed = {}
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(b) == 1 then
			table.insert(listed, b)
		end
	end

	local total_bufs = #listed
	local index = 0
	for i, b in ipairs(listed) do
		if b == current_buf then
			index = i
			break
		end
	end

	local current_tab = vim.fn.tabpagenr()
	local total_tabs = vim.fn.tabpagenr("$")

	-- local devicons = require("nvim-web-devicons")

	-- get icon for current buffer
	-- local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(current_buf), ":t")
	-- local ext = vim.fn.fnamemodify(name, ":e")
	-- local icon, icon_hl = get_icon_for_buf(0)

	-- git branch: prefer gitsigns, fallback to raw git
	local branch = get_git_branch(current_buf)

	local s = "  "
	-- s = s .. "%#TabLineSel# 󱂬 " .. current_tab .. "/" .. total_tabs .. ""
	s = s .. "%#TabLineSel# " .. current_tab .. "/" .. total_tabs .. ""

	-- s = s .. "%#TabLineFill#  " .. index .. "/" .. total_bufs .. ""

	s = s .. "%#TabLineFill# " .. index .. "/" .. total_bufs .. ""

	-- if icon and icon_hl then
	-- 	s = s .. "%#606060" .. icon_hl .. "# " .. icon .. ""
	-- end

	if branch ~= "" then
		-- s = s .. " [" .. "  " .. branch .. " ]"

		s = s .. " [" .. branch .. "]"
	end

	return s .. "%#TabLineFill#"
end

o.tabline = "%!v:lua.Bufferline()"
o.backup = false
o.swapfile = false
o.directory = home .. "/.config/nvim/.swp/"
o.undodir = home .. "/.config/nvim/.undo/"
o.undofile = true -- enable undo file
o.undolevels = 1000
o.undoreload = 10000
o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set undo file directory
o.history = 1000
o.shada = { "!", "'1000", "<50", "s10", "h" }

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")
set_cursorline("FileType", false, "mason")
set_cursorline("FileType", false, "checkhealth")
set_cursorline("FileType", false, "help")
set_cursorline("FileType", false, "fzf")
set_cursorline("FileType", false, "oil")

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be made dark
-- o.background = "light" -- colorschemes that can be light or dark will be made dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
o.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

o.iskeyword:append("-") -- consider string-string as whole word

o.title = false
o.guifont = "monospace:h8"
o.ruler = false
