local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	sync_install = true,
	auto_install = true,
	indent = { enable = true },
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
	autopairs = { enable = true },
	highlight = { enable = true, additional_vim_regex_highlighting = true },
	autotag = { enable = true, enable_rename = true, enable_close = true, enable_close_on_slash = false },
	context_commentstring = { enable = true, enable_autocmd = true },
})

vim.filetype.add({
	extension = {
		mdx = "mdx",
		conf = "bash",
	},
})

vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("conf", "bash")
