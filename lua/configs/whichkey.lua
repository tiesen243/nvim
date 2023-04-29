local wk = require("which-key")

local mappings = {
	q = { ":q<cr>", "Quit" },
	Q = { ":wq<cr>", "Save and Quit" },
	e = { ":NvimTreeToggle<cr>", "Explorer" },
	f = { ":Telescope find_files<cr>", "Find Files" },
	c = {":e ~/AppData/Local/nvim/init.lua<cr>", "Configuartion"},
	b = {
		name = "Buffers",
		x = { ":bnext<cr>", "Next Buffer" },
		z = { ":bprevious<cr>", "Previous Buffer" },
		d = { "<cmd>bd<cr>", "Delete Buffer" },
	},
	g = {
		name = "Git",
		a = { ":!Git add .<cr>", "Add File" },
		c = { ":!Git commit -m ''<cr>", "Commit" },
		p = { ":!Git push<cr>", "Push" },
		i = { ":!Git init<cr>", "Init" },
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
