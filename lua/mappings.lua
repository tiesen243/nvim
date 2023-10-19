local km = vim.keymap

local lazygit = function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
	lazygit:toggle()
end

-- Basic
km.set("n", "x", '"_x', { desc = "Delete without yanking" })
km.set("n", "s", ":w!<CR>", { desc = "Save", silent = true })
km.set("n", "z", ":undo<CR>", { desc = "Undo", silent = true })
km.set("n", "<leader>;", ":Alpha<CR>", { desc = "Dashboard", silent = true })
km.set("n", "<Esc>", ":noh<CR>", { desc = "Exit Search", silent = true })

-- Delete word backward
km.set("n", "dw", 'vb"_d', { desc = "Delete Word Backward" })

-- Select all
km.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- Split window
km.set("n", "<leader>ss", ":split<return><C-w>w", { desc = "Split", silent = true })
km.set("n", "<leader>sv", ":vsplit<return><C-w>w", { desc = "Vsplit", silent = true })

-- Bufferline
km.set("n", "<leader>]", ":BufferLineCycleNext<CR>", { desc = "Next Buffer", silent = true })
km.set("n", "<leader>[", ":BufferLineCyclePrev<CR>", { desc = "Prev Buffer", silent = true })
km.set("n", "<leader>b}", ":BufferLineCloseRight<CR>", { desc = "Close Buffer Right", silent = true })
km.set("n", "<leader>b{", ":BufferLineCloseLeft<CR>", { desc = "Close Buffer Left", silent = true })
km.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick Buffer", silent = true })
km.set("n", "<leader>bP", ":BufferLinePickClose<CR>", { desc = "Pick Close Buffer", silent = true })

-- Terminal
km.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle Terminal", silent = true })
km.set("n", "<leader>tg", lazygit, { desc = "Lazygit", silent = true })

-- Fuzzy Finder
km.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files", silent = true })
km.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep", silent = true })
km.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers", silent = true })
km.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recently opened files", silent = true })
km.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File Browser", silent = true })

-- Comment
km.set("n", "<leader>/", ":CommentToggle<CR>", { desc = "Comment", silent = true })
km.set("v", "<leader>/", ":'<,'>CommentToggle<CR>", { desc = "Comment", silent = true })

-- Increment & Decrement
km.set("n", "+", "<C-a>", { desc = "Increment" })
km.set("n", "-", "<C-x>", { desc = "Decrement" })
