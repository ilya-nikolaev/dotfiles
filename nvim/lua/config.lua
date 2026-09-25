-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- UI
vim.opt.linebreak = true
vim.opt.wrap = false

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5

vim.opt.guicursor = "i:block"
vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  extends = "›",
  precedes = "‹",
}

vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.errorbells = false

-- Watcher
vim.opt.autoread = true

-- Mapleader
vim.g.mapleader = " "

-- Autocomplete
vim.opt.autocomplete = true
