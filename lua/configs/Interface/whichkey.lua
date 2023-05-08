local status, wk = pcall(require, "which-key")
if not status then
	return
end

local mappings = {
	q = { "<cmd>q<cr>", "Quit" },
	Q = { "<cmd>wq<cr>", "Save and Quit" },
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	r = { "<cmd>RunCode<cr>", "Run Code" },
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
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	l = {
		name = "LSP",
		g = {
			name = "GoTo",
			f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP Finder" },
			d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
			D = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
			i = { "<cmd>Lspsaga implementation<cr>", "Implementation" },
		},
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Diagnostics" },
		d = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Diagnostics" },
		k = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
		o = { "<cmd>LSoutlineToggle<cr>", "Out Line Toggle" },
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
