require("tokyonight").setup({
	style = "moon",
	light_style = "moon",
	transparent = true,
	styles = {
		sildebars = "transparent",
		floats = "transparent",
	},
	comments = { italic = true },
	keywords = { italic = true },
	functions = { bold = true },
})

vim.cmd [[colorscheme tokyonight-moon]]
