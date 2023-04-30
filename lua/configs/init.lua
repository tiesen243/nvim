-- Interface
require("configs.Interface.nvim-tree")
require("configs.Interface.lualine")
require("configs.Interface.bufferline")
require("configs.Interface.alpha")
require("configs.Interface.whichkey")
vim.cmd("colorscheme dracula")

-- Autocomplete
require("configs.Autocomplete.copilot")
require("configs.Autocomplete.cmp")
require("configs.Autocomplete.autopairs")

-- LSP
require("configs.LSP.lsp")
require("configs.LSP.mason")
require("configs.LSP.lspsaga")
require("configs.LSP.treesitter")
require("configs.LSP.null-ls")

-- Git
require("configs.git")
