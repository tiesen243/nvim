local status, wk = pcall(require, "which-key")
if not status then
	return
end

local mappings = {
	q = { "<cmd>q<cr>", "Quit" },
	Q = { "<cmd>wq<cr>", "Save and Quit" },
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	},
	g = {
		name = "Git",
		s = { "<cmd>!Git status<cr>", "Status" },
		a = { "<cmd>!Git add .<cr>", "Add" },
		c = { "<cmd>!Git commit -m ''<cr>", "Commit" },
		p = { "<cmd>!Git push<cr>", "Push" },
		P = { "<cmd>!Git pull<cr>", "Pull" },
	},
}

local opts = {
	mode = "n",
	prefix = " ",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
vim.o.timeoutlen = 300
vim.o.timeout = true
wk.register(mappings, opts)
