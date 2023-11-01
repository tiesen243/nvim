local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	terminal = {
		cmd = "alacritty",
	},
})

local opts = function(desc)
	return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
end
local km = vim.keymap

km.set("n", "<leader>lj", ":Lspsaga diagnostic_jump_next<CR>", opts("Jump to next diagnostic"))
km.set("n", "<leader>lp", ":Lspsaga peek_definition<CR>", opts("Peek definition"))
km.set("n", "<leader>lh", ":Lspsaga hover_doc<CR>", opts("Hover doc"))
km.set("n", "<leader>lf", ":Lspsaga finder<CR>", opts("Finder"))
km.set("n", "<leader>lg", ":Lspsaga goto_definition<CR>", opts("Goto definition"))
km.set("n", "<leader>lr", ":Lspsaga rename<CR>", opts("Rename"))
km.set("n", "<leader>la", ":Lspsaga code_action<CR>", opts("Code action"))
km.set("n", "<leader>lo", ":Lspsaga outline<CR>", opts("Outline view"))
km.set("n", "<leader>lw", ":Lspsaga show_workspace_diagnostics<CR>", opts("Workspace diagnostics"))
