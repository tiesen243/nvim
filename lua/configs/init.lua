-- Interface
require("configs.Interface.nvim-tree")
require("configs.Interface.lualine")
require("configs.Interface.bufferline")
require("configs.Interface.alpha")
require("configs.Interface.whichkey")

-- Autocomplete
require("configs.Autocomplete.copilot")
require("configs.Autocomplete.cmp")
require("configs.Autocomplete.autopairs")

-- LSP
require("configs.LSP.lsp")
require("configs.LSP.mason")
require("configs.LSP.treesitter")

-- Others
vim.cmd('colorscheme dracula')

