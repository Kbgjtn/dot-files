vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"

local home = os.getenv("HOME")
local o = vim.opt
local g = vim.g

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- disable unused stuff
g.loaded = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1 -- use vim-matchup
g.loaded_matchparen = 1 -- use vim-matchup
g.completeopt = { "menuone", "noinsert", "noselect" }

o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.title = true
o.hlsearch = true
o.incsearch = true
o.smartindent = true
o.showcmd = true
o.laststatus = 2
o.cmdheight = 1
o.scrolloff = 10
o.shell = "bash"
o.backupskip = { "/tmp/*", "/private/tmp/*" }
o.inccommand = "split"
o.smarttab = true
o.backspace = { "start", "eol", "indent" }
o.path:append({ "**" }) -- Finding files - Search down into subfolders
o.wildignore:append({ "*/node_modules/*" })
o.cursorcolumn = false
o.isfname:append("@-@")
o.updatetime = 50
o.startofline = true

-- wait time
-- opt.timeout = false
o.timeoutlen = 300
o.ttimeout = true
o.ttimeoutlen = 100

-- display
o.showmatch = true -- show matching brackets
o.scrolloff = 3 -- always show 3 rows from edge of the screen
o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
o.laststatus = 2 -- always show status line

o.list = false -- do not display white characters
o.foldenable = false -- do not enable folding by default
o.foldlevel = 4
o.foldmethod = "syntax" -- fold based on syntax level
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
o.formatoptions:append({ "r" })

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)
vim.wo.number = true

-- tabs & indentation
o.tabstop = 4 -- 2 spaces for tabs (prettier default)
o.shiftwidth = 4 -- 2 spaces for indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one
o.textwidth = 50 -- wrap lines at 80 characters

-- line wrapping
o.wrap = false -- disable line wrapping
o.linebreak = true

o.backup = true
o.swapfile = false
o.backupdir = home .. "/.config/nvim/.backup/"
o.directory = home .. "/.config/nvim/.swp/"
o.undodir = home .. "/.config/nvim/.undo/"
o.undofile = true -- enable undo file
o.undolevels = 1000
o.undoreload = 10000
o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set undo file directory
o.history = 1000

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line

o.termguicolors = true
o.winblend = 1
o.wildoptions = "pum"
o.background = "dark"

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
o.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

o.iskeyword:append("-") -- consider string-string as whole word
