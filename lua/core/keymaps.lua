local key = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
end

-- General
key("n", "<C-a>", "<cmd>normal! ggVG<cr>", opts("Select all"))
key("n", "<C-s>", "<cmd>write<cr>", opts("Save current buffer"))
key("n", "<leader>q", "<cmd>wqa<cr>", opts("Save and close all buffers"))

-- Undo & Redo
key("n", "<C-z>", "<cmd>undo<cr>", opts("Undo"))
key("n", "<C-r>", "<cmd>redo<cr>", opts("Redo"))
key("n", "u", "<nop>", opts("Disable undo"))

-- Delete without yanking
key("n", "x", '"_x', opts("Delete without yanking"))

-- Increment & Decrement
key("n", "=", "<C-a>", opts("Increment"))
key("n", "-", "<C-x>", opts("Decrement"))

-- Split navigation
key("n", "<leader>s", "<nop>", opts("Split"))
key("n", "<leader>ss", "<cmd>split<cr>", opts("Split horizontally"))
key("n", "<leader>sv", "<cmd>vsplit<cr>", opts("Split vertically"))

-- Lazy vim
key("n", "<leader>L", "<nop>", opts("Lazy"))
key("n", "<leader>Ls", "<cmd>Lazy sync<cr>", opts("Lazy sync"))
key("n", "<leader>LS", "<cmd>Lazy show<cr>", opts("Lazy show"))
key("n", "<leader>Lc", "<cmd>Lazy check<cr>", opts("Lazy check"))
key("n", "<leader>Lu", "<cmd>Lazy update<cr>", opts("Lazy update"))
key("n", "<leader>Li", "<cmd>Lazy install<cr>", opts("Lazy install"))

-- Options
key("n", "<leader>o", "<nop>", opts("Options"))
key("n", "<leader>oc", "<cmd>Telescope colorscheme<cr>", opts("Colorscheme"))
