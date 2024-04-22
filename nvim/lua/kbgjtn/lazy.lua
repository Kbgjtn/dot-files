local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

local config = {
   defaults = { version = false },
   checker = { enabled = true, notify = false },
   change_detection = { notify = false },
   performance = {
      rtp = {
         disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
      },
   },
}

local pluginpath = {
   { import = "kbgjtn.plugins" },
   { import = "kbgjtn.plugins.lsp" },
}

require("lazy").setup(pluginpath, config)
