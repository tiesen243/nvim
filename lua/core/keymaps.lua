local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
end

-- General
map({ "n", "x" }, "9", "$", opts("End of line"))
map("n", "x", '"_x', opts("Delete without yanking"))
map("n", "<C-a>", "<cmd>normal! ggVG<cr>", opts("Select all"))
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts("Quit search mode"))
map("n", "<leader>q", "<cmd>wqa<cr>", opts("Save and close all buffers"))
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<cr><esc>", opts("Save current buffer"))

-- Undo & Redo
map("n", "u", "<nop>", opts("Disable undo"))
map("n", "<C-z>", "<cmd>undo<cr>", opts("Undo"))
map("n", "<C-r>", "<cmd>redo<cr>", opts("Redo"))

-- Increment & Decrement
map("n", "=", "<C-a>", opts("Increment"))
map("n", "-", "<C-x>", opts("Decrement"))

-- Split navigation
map("n", "<leader>s", "<nop>", opts("Split"))
map("n", "<leader>sv", "<cmd>vsplit<cr>", opts("Split vertically"))
map("n", "<leader>ss", "<cmd>split<cr>", opts("Split horizontally"))

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>lua require('tmux').resize_top()<cr>", opts("Increase Window Height"))
map("n", "<C-Left>", "<cmd>lua require('tmux').resize_left()<cr>", opts("Decrease Window Width"))
map("n", "<C-Right>", "<cmd>lua require('tmux').resize_right()<cr>", opts("Increase Window Width"))
map("n", "<C-Down>", "<cmd>lua require('tmux').resize_bottom()<cr>", opts("Decrease Window Height"))

-- Move Lines
map("n", "<A-k>", "<cmd>m .-2<cr>==", opts("Move Up"))
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts("Move Down"))
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts("Move Up"))
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts("Move Down"))
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts("Move Up"))
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts("Move Down"))

-- Indentation
map("n", "<", "<<", opts("Indent"))
map("n", ">", ">>", opts("Indent"))
map("v", "<", "<gv", opts("Indent"))
map("v", ">", ">gv", opts("Indent"))

-- Terminal
map("t", "<esc>", "<C-\\><C-n>", opts("Exit terminal mode"))
map("n", "<leader>t", "<cmd>below 10sp term://$SHELL<cr>", opts("Open terminal"))

-- Options
map("n", "<leader>o", "<nop>", opts("Options"))
map("n", "<leader>ol", "<cmd>Lazy<cr>", opts("Lazy"))
map("n", "<leader>om", "<cmd>Mason<cr>", opts("Mason"))
map("n", "<leader>ow", "<cmd>set wrap!<cr>", opts("Toggle wrap text"))
map("n", "<leader>on", "<cmd>set number!<cr>", opts("Toggle line number"))
map("n", "<leader>oc", "<cmd>Telescope colorscheme<cr>", opts("Colorscheme"))
map("n", "<leader>ot", "<cmd>TransparentToggle<cr>", opts("Toogle transparent"))
