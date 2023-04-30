require("transparent").setup({
	enabled = true,
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
		"alpha",
  },
})

vim.cmd [[colorscheme dracula]]
