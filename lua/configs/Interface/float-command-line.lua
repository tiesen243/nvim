local status, cmdline = pcall(require, "fine-cmdline")
if not status then
	return
end

vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

cmdline.setup({
	popup = {
		position = {
			row = "10%",
			col = "50%",
		},
		size = {
			width = "60%",
		},
		border = {
			style = "rounded",
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	cmdline = {
		enable_keymaps = true,
		smart_history = true,
		prompt = "> ",
	},
})
