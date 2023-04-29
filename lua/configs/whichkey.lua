local wk = require("which-key")

local mappings = {
	q = { ":q <CR>", "Quit" },
	Q = { ":wq <CR>", "Save and Quit" },
	e = { ":NvimTreeToggle <CR>", "Explorer" },
	C = { ":e ~/AppData/Local/nvim/init.lua <CR>", "Configuartion" },
	f = {
		name = "File",
		f = { ":Telescope find_files <CR>", "Find Files" },
		m = { ":vim.lsp.buf.format() <CR>", "Format"}
	},
	g = {
		name = "Git",
		i = { ":!Git init<cr>", "Init" },
		a = { ":!Git add .<cr>", "Add File" },
		c = { ":!Git commit -m 'nothing'<cr>", "Commit" },
		p = { ":!Git push<cr>", "Push" },
		P = { ":!Git pull<cr>", "Pull" },
	}
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
}

wk.register(mappings, opts)
