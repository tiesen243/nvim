-- Variables
local opt = vim.opt
local g = vim.g
local km = vim.keymap

-- General

-- Line Number
opt.number = true
opt.relativenumber = false

-- Tab & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.shiftround = true

-- Line Wrap
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = false

-- Appearance
opt.termguicolors = false
vim.cmd([[set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\,sm:block-blinkwait175-blinkoff150-blinkon175]])

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Others
opt.iskeyword:append("-")

-- Auto
opt.autowrite = true
opt.autoread = true
opt.autochdir = true

-- Key Maping
g.mapleader = " "
km.set("n", "<C-s>", ":w<CR>")
-- Dashboard
km.set("n", "<leader>;", ":Alpha<CR>")
-- Buffer
km.set("n", "<leader>]", ":BufferLineCycleNext<CR>")
km.set("n", "<leader>[", ":BufferLineCyclePrev<CR>")
-- Comment
km.set("n", "<leader>/", ":CommentToggle<CR>")
-- Telescope
km.set("n", "<leader>ff", ":Telescope find_files<CR>")
km.set("n", "<leader>fg", ":Telescope live_grep<CR>")
km.set("n", "<leader>fb", ":Telescope buffers<CR>")
-- Tree
km.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Global
g.maplocalleader = " "
g.python3_host_prog = "~/AppData/Local/Programs/Python/Python311/python.exe"
