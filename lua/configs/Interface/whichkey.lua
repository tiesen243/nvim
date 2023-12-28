local status, wk = pcall(require, "which-key")
if not status then
	return
end

local mappings = {
	b = { name = "Bufferline" },
	e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	f = { name = "Fuzzy Finder" },
	g = { name = "Git" },
	h = { name = "Hop" },
	l = { name = "LSP" },
	o = {
		name = "Options",
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		m = { "<cmd>Mason<CR>", "Mason" },
		t = { "<cmd>TransparentToggle<CR>", "Transparent" },
	},
	q = { "<cmd>wqa<CR>", "Save and Quit" },
	s = { name = "Spectre" },
	S = { name = "Split" },
	t = { name = "Terminal" },
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
