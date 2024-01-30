local km = vim.keymap

local lazygit = function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
	lazygit:toggle()
end

local opts = function(desc)
	return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
end

-- Basic
km.set("n", "x", '"_x', opts("Delete char"))
km.set("n", "<C-s>", "<cmd>w<CR>", opts("Save"))
km.set("i", "<C-s>", "<Esc>:w<CR>", opts("Save"))
km.set("n", "<C-z>", "<cmd>undo<CR>", opts("Undo"))
km.set("i", "<C-z>", "<Esc>:undo<CR>", opts("Undo"))
km.set("n", "<C-r>", "<cmd>redo<CR>", opts("Quit"))
km.set("n", "<leader>;", "<cmd>Alpha<CR>", opts("Dashboard"))
km.set("n", "<Esc>", "<cmd>noh<CR>", opts("Escape search highlight"))

-- Select all
km.set("n", "<C-a>", "gg<S-v>G", opts("Select all"))

-- Split window
km.set("n", "<leader>Ss", "<cmd>split<return><C-w>w", opts("Split"))
km.set("n", "<leader>Sv", "<cmd>vsplit<return><C-w>w", opts("Vsplit"))

-- Bufferline
km.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts("Next Buffer"))
km.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts("Prev Buffer"))
km.set("n", "<leader>b}", "<cmd>BufferLineCloseRight<CR>", opts("Close Buffer Right"))
km.set("n", "<leader>b{", "<cmd>BufferLineCloseLeft<CR>", opts("Close Buffer Left"))
km.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", opts("Pick Buffer"))
km.set("n", "<leader>bP", "<cmd>BufferLinePickClose<CR>", opts("Pick Buffer and Close"))

-- Terminal
km.set("n", "<leader>tg", lazygit, opts("Lazygit"))
km.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts("Toggle Terminal"))

-- Fuzzy Finder
km.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts("Find Files"))
km.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts("Live Grep"))
km.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts("Find Buffers"))
km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts("Find Recent Files"))
km.set("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", opts("File Browser"))

-- Spectre
vim.keymap.set("n", "<leader>ss", '<cmd>lua require("spectre").toggle()<CR>', opts("Toggle Spectre"))
km.set(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	opts("Search current word")
)
km.set("v", "<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', opts("Search visual selection"))
km.set(
	"n",
	"<leader>sf",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	opts("Search current word in file")
)

-- Git
km.set("n", "<leader>go", "<cmd>DiffviewOpen<CR>", opts("Git Diff"))
km.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", opts("Git Diff Close"))
km.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts("Git Status"))
km.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts("Git Branches"))
km.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts("Git Commits"))

-- Copilot
vim.cmd([[ imap <silent><script><expr> <C-a> copilot#Accept("\<CR>") ]])

-- Increment & Decrement
km.set("n", "=", "<C-a>", opts("Increment"))
km.set("n", "-", "<C-x>", opts("Decrement"))

-- Change some default mappings
km.set("n", "u", "<nop>", opts("Disable undo"))
km.set("n", "a", "<nop>", opts("Disable append"))
