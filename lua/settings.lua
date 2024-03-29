﻿-- Variables
local opt = vim.opt
local g = vim.g

-- General

-- Line Number
opt.number = true
opt.relativenumber = false

-- Tab & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true
opt.smartindent = true
opt.smarttab = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Cursor Background
opt.cursorline = true
opt.cursorcolumn = false
opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Appearance
opt.termguicolors = true
opt.syntax = "enable"
opt.title = true
opt.wrap = false
opt.completeopt = "menu,menuone,noselect"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split Windows
opt.splitbelow = true
opt.splitright = true

-- Auto
opt.autoindent = true
opt.autowrite = true
opt.autoread = true
opt.autochdir = true

-- Others
opt.iskeyword:append("-")
opt.fillchars:append({ eob = " " })
opt.mousemoveevent = true
opt.encoding = "utf-8"
opt.swapfile = false
opt.foldenable = false
opt.foldmethod = "indent"

-- Global
g.mapleader = " "
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.matchup_matchparen_offscreen = { method = "popup" }
g.copilot_filetypes = { ["*"] = true }
g.mkdp_auto_start = 0
g.mkdp_auto_close = 0

-- Highlight
vim.cmd([[autocmd ColorScheme * highlight Pmenu guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=none guifg=none]])
vim.cmd([[autocmd ColorScheme * highlight TelescopeNormal guibg=none guifg=none]])
vim.cmd([[autocmd ColorScheme * highlight NvimTreeNormal guibg=none guifg=none]])

local notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
