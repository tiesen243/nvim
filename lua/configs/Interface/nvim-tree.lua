local setup, tree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_gitignore = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#5f5faf ]])

tree.setup({
	hijack_cursor = true,
	auto_reload_on_write = true,
	renderer = {
		special_files = { "README.md", "readme.md", ".git" },
		highlight_git = true,
		highlight_opened_files = "true",
		icons = {
			glyphs = {
				folder = {
					default = "",
					open = "",
					symlink = "",
					arrow_closed = "",
					arrow_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
				},
			},
		},
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	view = {
		cursorline = false,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = true,
			restrict_above_cwd = true,
		},
		open_file = {
			quit_on_open = true,
			resize_window = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
		},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
})
