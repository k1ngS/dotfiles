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

require("settings")
require("maps")
require("plugins")

-- Statusline
local lualine = require("lualine")
local eviline = require'lualine.themes.evil_lualine'

lualine.setup({
    options = { 
      theme = eviline,
      separator_style = "default",
      overriden_modules = nil,
    },
})

-- Bufferline
local bufferline = require("bufferline")

bufferline.setup({
  options = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },
})

-- Colorscheme
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
  vim.cmd("colorscheme kanagawa")
else
  return
end


