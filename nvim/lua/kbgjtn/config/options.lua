vim.scriptencoding = "utf-8"

vim.lsp.set_log_level("off")

local home = os.getenv("HOME")
local o = vim.opt
local g = vim.g

vim.filetype.add({ extension = {
   templ = "templ",
   md = "markdown",
   mdx = "markdown",
   env = "env",
} })

g.better_escape_shortcut = { "jk", "jj", "kj" }
g.better_escape_interval = 200

g.vim_markdown_math = 1
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

g.go_def_mode = "gopls"
g.go_info_mode = "gopls"
g.go_fmt_command = "gopls"
g.go_gopls_gofumpt = 1

g.copilot_assume_mapped = true
g.copilot_filetypes = {
   markdown = true,
   yaml = true,
   json = true,
   gitcommit = true,
   templ = true,
}

-- disable unused stuff
g.loaded = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1 -- use vim-matchup
g.loaded_matchparen = 1 -- use vim-matchup
g.netrw_list_hide = 0
g.netrw_hide = 0
g.completeopt = { "menu", "menuone", "noselect" }
g.netrw_keepdir = 1
g.netrw_liststyle = 0
g.netrw_banner = 0
g.netrw_altv = 1
g.root_spec = { "cwd" }

o.syntax = "on"
o.hidden = true

-- Pmenusell to transparancy
-- o.pumblend = 15

o.conceallevel = 0
o.mouse = "a"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.hlsearch = true
o.incsearch = true
o.smartindent = true
o.showcmd = true
o.cmdheight = 0

o.equalalways = false
o.laststatus = 0
o.scrolloff = 0
o.sidescrolloff = 8
o.shell = "zsh"
o.backupskip = { "/tmp/*", "/private/tmp/*" }
o.inccommand = "split"
o.smarttab = true
o.backspace = { "start", "eol", "indent" }
o.path:append({ "*.*" })
o.wildoptions:append({ "pum", "tagfile" })
o.pumheight = 7
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
}
o.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
o.guicursor = {
   "i-ci-ve:ver85-Cursor/lCursor",
   "n-v-c:block-Cursor/lCursor",
   "i-ci-ve:ver25-Cursor/lCursor",
   "r-cr:hor20-Cursor/lCursor",
   "o:hor50-Cursor/lCursor",
   "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
}

-- wait time
-- opt.timeout = false
o.timeoutlen = 300
o.ttimeout = true
o.ttimeoutlen = 100

o.syntax = "on" -- syntax highlighting

-- display
o.showmatch = true -- show matching brackets
o.scrolloff = 10 -- always show 3 rows from edge of the screen
o.synmaxcol = 300 -- stop syntax highlight after x lines for performance

o.list = false -- do not display white characters
o.foldenable = true -- do not enable folding by default
o.foldlevel = 99
o.foldmethod = "expr" -- fold based on syntax level
o.foldlevelstart = 99
o.foldcolumn = "0" -- show fold column when there are folds
o.eol = false -- show if there's no eol char
o.showbreak = "↳ " -- show this when line is broken
o.modelines = 0
o.foldexpr = "nvim_treesitter#foldexpr()"

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

o.showtabline = 0
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

o.title = false
o.guifont = "monospace:h8"
o.ruler = false
