local status, wk = pcall(require, "which-key")
if not status then
	return
end

local mappings = {
	q = { "<cmd>wqa<cr>", "Save and Quit" },
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	r = { "<cmd>RunCode<cr>", "Code Runner" },
	t = { name = "Terminal" },
	b = { name = "Bufferline" },
	c = { "<cmd>Copilot panel<cr>", "Copilot Panel" },
	l = { name = "LSP" },
	s = { name = "Split" },
	f = { name = "Fuzzy Finder" },
	o = {
		name = "Options",
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		t = { "<cmd>TransparentToggle<cr>", "Transparent" },
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
