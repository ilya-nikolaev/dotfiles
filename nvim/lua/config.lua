-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- UI
vim.opt.encoding = "utf-8"

vim.opt.linebreak = true
vim.opt.wrap = true

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5

vim.opt.guicursor = "i:block"
vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
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

-- Syntax
vim.opt.syntax = "on"

-- Watcher
vim.opt.autoread = true

-- Mapleader
vim.g.mapleader = " "
