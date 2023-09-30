local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	sync_install = true,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"lua",
		"python",
		"javascript",
		"css",
		"html",
		"json",
		"tsx",
		"gitignore",
		"markdown",
		"markdown_inline",
	},
})
