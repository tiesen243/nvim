-- Variables
local opt = vim.opt
local g = vim.g

-- General

-- Set powershell as shell
vim.cmd([[ 
  	let &shell = executable('pwsh') ? 'pwsh -NoLogo' : 'powershell -NoLogo'
		let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
		set shellquote= shellxquote=
]])

-- Line Number
opt.number = true
opt.relativenumber = false

-- Tab & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.shiftround = true
opt.smartindent = true
opt.smarttab = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true
opt.cursorcolumn = false

-- Appearance
opt.termguicolors = true
opt.syntax = "enable"
opt.title = true
opt.wrap = true
vim.cmd([[
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\,sm:block-blinkwait175-blinkoff150-blinkon175
]])

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

-- Global
g.mapleader = " "
g.loaded_node_provider = 0
g.loaded_python3_provider = 0

-- Notify
local notify = vim.notify
notify = require("notify")
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	notify(msg, ...)
end
