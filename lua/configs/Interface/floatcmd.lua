local fineline_status, fineline = pcall(require, "fine-cmdline")
local fn = fineline.fn
if not fineline_status then
	return
end

local dressing_status, dressing = pcall(require, "dressing")
if not dressing_status then
	return
end

vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

fineline.setup({
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
	hooks = {
		set_keymaps = function(imap)
			imap("<Esc>", fn.close)
			imap("<C-k>", fn.up_search_history)
			imap("<C-j>", fn.down_search_history)
		end,
	},
})

dressing.setup({
	input = {
		title_pos = "center",
		win_options = {
			winblend = 0,
		},
	},
	select = {
		nui = {

			win_options = {
				winblend = 0,
			},

			builtin = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},
})
