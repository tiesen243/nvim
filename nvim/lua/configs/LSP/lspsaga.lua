local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup()

local opts = { noremap = true, silent = true }
local km = vim.keymap

km.set("n", "<leader>lj", ":Lspsaga diagnostic_jump_next<CR>", opts)
km.set("n", "<leader>lp", ":Lspsaga peek_definition<CR>", opts)
km.set("n", "<leader>lh", ":Lspsaga hover_doc<CR>", opts)
km.set("n", "<leader>lf", ":Lspsaga finder<CR>", opts)
km.set("n", "<leader>lg", ":Lspsaga goto_definition<CR>", opts)
km.set("n", "<leader>lr", ":Lspsaga rename<CR>", opts)
km.set("n", "<leader>la", ":Lspsaga code_action<CR>", opts)
