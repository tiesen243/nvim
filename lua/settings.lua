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
opt.cursorcolumn = false

-- Appearance
opt.termguicolors = false
vim.cmd(
	[[set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\,sm:block-blinkwait175-blinkoff150-blinkon175]]
)

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitbelow = true
opt.splitright = true

-- Others
opt.iskeyword:append("-")
opt.fillchars:append({ eob = " " })
opt.mousemoveevent = true

-- Auto
opt.autowrite = true
opt.autoread = true
opt.autochdir = true

-- Key Mappings
g.mapleader = " "
km.set("n", "<C-s>", ":w<CR>", { desc = "Save" })
-- Dashboard
km.set("n", "<leader>;", ":Alpha<CR>", { desc = "Dashboard" })
-- Buffer
km.set("n", "<leader>]", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
km.set("n", "<leader>[", ":BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
-- Comment
km.set("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment" })

-- Hide Warning
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	notify(msg, ...)
end
