require "options"
require "keymaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip"})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
