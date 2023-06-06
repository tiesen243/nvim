local status, wk = pcall(require, "which-key")
if not status then
	return
end

-- Git
local commit = function()
	local mess = vim.fn.input("Commit message: ")
	local cmd = '!Git commit -m "' .. mess .. '"'
	vim.cmd(cmd)
end
local branch = function()
	local branch = vim.fn.input("Branch name: ")
	local cmd = '!Git branch -m "' .. branch .. '"'
	vim.cmd(cmd)
end
local remote = function()
	local repo = vim.fn.input("Repository: ")
	local cmd = '!Git remote add origin "' .. repo .. '"'
	vim.cmd(cmd)
end
local checkout = function()
	local branch = vim.fn.input("Branch name: ")
	local cmd = '!Git checkout "' .. branch .. '"'
	vim.cmd(cmd)
end

local mappings = {
	q = { "<cmd>wqa<cr>", "Save and Quit" },
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	r = { "<cmd>RunCode<cr>", "Run Code" },
	t = { "<cmd>ToggleTerm<cr>", "Terminal" },
	f = {
		name = "Fuzzy Finder",
		f = { "<cmd>Telescope find_files<cr>", "Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recently opened files" },
	},
	g = {
		name = "Git",
		i = { "<cmd>!Git init<cr>", "Init" },
		b = { branch, "Branch" },
		r = { remote, "Remote" },
		s = { "<cmd>!Git status<cr>", "Status" },
		a = { "<cmd>!Git add .<cr>", "Add" },
		c = { commit, "Commit" },
		C = { checkout, "Checkout" },
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
		k = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
		o = { "<cmd>LSoutlineToggle<cr>", "Out Line Toggle" },
	},
}

local opts = {
	mode = { "n" },
	prefix = " ",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
vim.o.timeoutlen = 100
vim.o.timeout = true
wk.register(mappings, opts)

wk.setup({
	window = {
		border = "rounded",
		winblend = -100,
		position = "bottom",
	},
	layout = {
		spacing = 10,
		align = "center",
	},
	triggers_blacklist = {
		n = { "v", "y", "[", "]", "d", "g", "'", "z", "c" },
		i = { "j", "k" },
		v = { "j", "k" },
	},
	triggers = "<leader>",
	shows_help = false,
	ignore_missing = false,
})
