local key = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
end

-- General
key("n", "<C-a>", "<cmd>normal! ggVG<cr>", opts("Select all"))
key({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts("Quit search mode"))
key("n", "<leader>q", "<cmd>wqa<cr>", opts("Save and close all buffers"))
key({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<cr><esc>", opts("Save current buffer"))

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

-- Resize window using <ctrl> arrow keys
key("n", "<C-Up>", "<cmd>resize +2<cr>", opts("Increase Window Height"))
key("n", "<C-Down>", "<cmd>resize -2<cr>", opts("Decrease Window Height"))
key("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts("Decrease Window Width"))
key("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts("Increase Window Width"))

-- Move Lines
key("n", "<A-j>", "<cmd>m .+1<cr>==", opts("Move Down"))
key("n", "<A-k>", "<cmd>m .-2<cr>==", opts("Move Up"))
key("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts("Move Down"))
key("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts("Move Up"))
key("v", "<A-j>", ":m '>+1<cr>gv=gv", opts("Move Down"))
key("v", "<A-k>", ":m '<-2<cr>gv=gv", opts("Move Up"))

-- Indentation
key("n", "<", "<<", opts("Indent"))
key("n", ">", ">>", opts("Indent"))
key("v", "<", "<gv", opts("Indent"))
key("v", ">", ">gv", opts("Indent"))

-- Terminal
key("n", "<leader>t", "<cmd>below 10sp term://$SHELL<cr>", opts("Open terminal"))

-- Options
key("n", "<leader>o", "<nop>", opts("Options"))
key("n", "<leader>ol", "<cmd>Lazy<cr>", opts("Lazy"))
key("n", "<leader>om", "<cmd>Mason<cr>", opts("Mason"))
key("n", "<leader>ow", "<cmd>set wrap!<cr>", opts("Wrap text"))
key("n", "<leader>on", "<cmd>set number!<cr>", opts("Toggle line number"))
key("n", "<leader>oc", "<cmd>Telescope colorscheme<cr>", opts("Colorscheme"))
key("n", "<leader>ot", "<cmd>TransparentToggle<cr>", opts("Toogle transparent"))
