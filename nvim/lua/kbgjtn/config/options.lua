vim.scriptencoding = "utf-8"

local home = os.getenv("HOME")

vim.filetype.add({
   extension = {
      templ = "templ",
      html = "html",
      md = "markdown",
      mdx = "markdown",
      env = "env",
      proto = "proto",
   },
})
vim.lsp.set_log_level("off")
vim.g.vim_markdown_math = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"
vim.g.go_fmt_command = "gopls"
vim.g.go_gopls_gofumpt = 1

vim.g.netrw_hide = 0
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 1
vim.g.netrw_list_hide = 0
vim.g.netrw_liststyle = 0

vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1

vim.g.copilot_assume_mapped = true
vim.g.completeopt = {
   "menu",
   "menuone",
   "noselect",
}
vim.g.copilot_filetypes = {
   markdown = true,
   yaml = true,
   json = true,
   gitcommit = true,
   templ = true,
}

-- Pmenusell to transparancy
-- o.pumblend = 15

vim.opt.syntax = "on"
vim.opt.hidden = true
vim.opt.conceallevel = 0
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.laststatus = 0
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 8
vim.opt.shell = "zsh"
vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.pumheight = 7
vim.opt.pumwidth = 2
vim.opt.cursorcolumn = false
vim.opt.updatetime = 1000
vim.opt.equalalways = false
vim.opt.startofline = true

vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")
vim.opt.path:append({ "*.*" })
vim.opt.wildoptions:append({ "pum", "tagfile" })
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.fillchars = {
   horiz = "━",
   horizup = "┻",
   horizdown = "┳",
   vert = "┃",
   vertleft = "┫",
   vertright = "┣",
   verthoriz = "╋",
}

vim.opt.diffopt = {
   "internal",
   "filler",
   "closeoff",
   "hiddenoff",
   "algorithm:minimal",
}

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.opt.guicursor = {
   "i-ci-ve:ver85-Cursor/lCursor",
   "n-v-c:block-Cursor/lCursor",
   "i-ci-ve:ver25-Cursor/lCursor",
   "r-cr:hor20-Cursor/lCursor",
   "o:hor50-Cursor/lCursor",
   "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
}

vim.opt.syntax = "on"
vim.opt.ttimeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 100

vim.opt.showmatch = true
vim.opt.scrolloff = 10
vim.opt.synmaxcol = 300

vim.opt.list = false
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "0"
vim.opt.eol = false
vim.opt.showbreak = "↳ "
vim.opt.modelines = 0
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
   pattern = "*",
   command = "set nopaste",
})

vim.opt.formatoptions:append({ "r" })
vim.opt.formatoptions = vim.opt.formatoptions
   - "a" -- Auto formatting is BAD.
   - "t" -- Don't auto format my code. I got linters for that.
   + "c" -- In general, I like it when comments respect textwidth
   + "q" -- Allow formatting comments w/ gq
   - "o" -- O and o, don't continue comments
   + "r" -- But do continue when pressing enter.
   + "n" -- Indent past the formatlistpat, not underneath it.
   + "j" -- Auto-remove comments if possible.
   - "2" -- I'm not in gradeschool anymore

vim.wo.number = true
vim.opt.number = true
vim.opt.joinspaces = false
vim.opt.relativenumber = true

vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.cindent = true
vim.opt.softtabstop = 3
vim.opt.textwidth = 200
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.compatible = false
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.showtabline = 0
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.directory = home .. "/.config/nvim/.swp/"
vim.opt.undodir = home .. "/.config/nvim/.undo/"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.history = 1000
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.cursorline = true

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
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.iskeyword:append("-")

vim.opt.title = false
vim.opt.guifont = "monospace:h8"
vim.opt.ruler = false
