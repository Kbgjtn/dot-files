local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)

vim.lsp.set_log_level("off")

local config = {
   defaults = { version = false },
   checker = { enabled = true, notify = false },
   install = { colorscheme = { "coocobolo" } },
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
