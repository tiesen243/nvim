local g = vim.g
local opt = vim.opt

-- General
opt.wrap = false
opt.showmode = false
opt.termguicolors = true

-- Numbers
opt.number = true
opt.relativenumber = false

-- Tab settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.shiftround = true
opt.smartindent = true

-- Search
opt.smartcase = true
opt.ignorecase = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Cursor
opt.cursorline = true
opt.cursorcolumn = false
opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Auto
opt.autoread = true
opt.autowrite = true
opt.autochdir = true
opt.autoindent = true
opt.autowriteall = true

-- Others
opt.list = true
opt.mouse = "a"
opt.scrolloff = 8
opt.pumblend = 10
opt.pumheight = 10
opt.swapfile = false
opt.linebreak = true
opt.conceallevel = 2
opt.concealcursor = nil
opt.fillchars.eob = " "
opt.shortmess:append("c")
opt.iskeyword:append("-")
opt.whichwrap:append("<,>,[,],h,l")
opt.completeopt = { "menuone", "noselect" }

-- Providers
g.loaded_node_provider = 0
g.loaded_python_provider = 0
g.loaded_python_provider = 0
g.loaded_python_provider = 0
