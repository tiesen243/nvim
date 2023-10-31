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
km.set("n", "<C-s>", ":w!<CR>", opts("Save"))
km.set("n", "<C-z>", ":undo<CR>", opts("Undo"))
km.set("n", "<leader>;", ":Alpha<CR>", opts("Dashboard"))
km.set("n", "<Esc>", ":noh<CR>", opts("Escape search highlight"))

-- Delete word backward
km.set("n", "dw", 'vb"_d', opts("Delete word backward"))

-- Select all
km.set("n", "<C-a>", "gg<S-v>G", opts("Select all"))

-- Split window
km.set("n", "<leader>ss", ":split<return><C-w>w", opts("Split"))
km.set("n", "<leader>sv", ":vsplit<return><C-w>w", opts("Vsplit"))

-- Bufferline
km.set("n", "<leader>]", ":BufferLineCycleNext<CR>", opts("Next Buffer"))
km.set("n", "<leader>[", ":BufferLineCyclePrev<CR>", opts("Prev Buffer"))
km.set("n", "<leader>b}", ":BufferLineCloseRight<CR>", opts("Close Buffer Right"))
km.set("n", "<leader>b{", ":BufferLineCloseLeft<CR>", opts("Close Buffer Left"))
km.set("n", "<leader>bp", ":BufferLinePick<CR>", opts("Pick Buffer"))
km.set("n", "<leader>bP", ":BufferLinePickClose<CR>", opts("Pick Buffer and Close"))

-- Terminal
km.set("n", "<leader>tt", ":ToggleTerm<CR>", opts("Toggle Terminal"))
km.set("n", "<leader>tg", lazygit, opts("Lazygit"))

-- Fuzzy Finder
km.set("n", "<leader>ff", ":Telescope find_files<CR>", opts("Find Files"))
km.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts("Live Grep"))
km.set("n", "<leader>fb", ":Telescope buffers<CR>", opts("Find Buffers"))
km.set("n", "<leader>fr", ":Telescope oldfiles<CR>", opts("Find Recent Files"))
km.set("n", "<leader>fe", ":Telescope file_browser<CR>", opts("File Browser"))

-- Hop
km.set("n", "<leader>hw", ":HopWord<CR>", opts("Hop Word"))
km.set("n", "<leader>hl", ":HopLine<CR>", opts("Hop Line"))
km.set("n", "<leader>hc", ":HopChar1<CR>", opts("Hop Char"))
km.set("n", "<leader>hC", ":HopChar2<CR>", opts("Hop Char 2"))
km.set("n", "<leader>hp", ":HopPattern<CR>", opts("Hop Pattern"))

-- Spectre
vim.keymap.set("n", "<leader>Ss", '<cmd>lua require("spectre").toggle()<CR>', opts("Toggle Spectre"))
km.set(
	"n",
	"<leader>Sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	opts("Search current word")
)
km.set("v", "<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', opts("Search visual selection"))
km.set(
	"n",
	"<leader>Sf",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	opts("Search current word in file")
)

-- Git
km.set("n", "<leader>go", ":DiffviewOpen<CR>", opts("Git Diff"))
km.set("n", "<leader>gc", ":DiffviewClose<CR>", opts("Git Diff Close"))

-- Increment & Decrement
km.set("n", "=", "<C-a>", opts("Increment"))
km.set("n", "-", "<C-x>", opts("Decrement"))
