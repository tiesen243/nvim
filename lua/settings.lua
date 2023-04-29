-- Variables
local opt = vim.opt
local g = vim.g
local km = vim.keymap

-- Leader
g.mapleader = ' '
g.maplocalleader = ' '
g.python3_host_prog ='~/AppData/Local/Programs/Python/Python311/python.exe'

-- General
opt.autowrite = true
opt.autoread = true
opt.cursorline = false
opt.number = true
opt.clipboard = 'unnamedplus'
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = false
opt.wrap = false

-- Key Maping
km.set('n', '<leader>space', ':nohlsearch<CR>')
km.set('n', '<C-s>', ':w<CR>')
km.set('n', '<leader>;', ':Alpha<CR>')
