local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	sync_install = true,
	auto_install = true,
	highlight = { enable = true, additional_vim_regex_highlighting = true },
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
	autotag = { enable = true, enable_rename = true, enable_close = true, enable_close_on_slash = true },
	rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
})
