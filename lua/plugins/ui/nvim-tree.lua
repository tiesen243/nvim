local M = { "nvim-tree/nvim-tree.lua" }

M.config = function()
	local status_ok, nvim_tree = pcall(require, "nvim-tree")
	if not status_ok then
		return
	end

	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.opt.termguicolors = true

	nvim_tree.setup({
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			enable = true,
			dotfiles = false,
			git_ignored = true,
			custom = { ".git" },
			exclude = { ".env", ".env*.local" },
		},
	})
end

M.keys = {
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File explorer" },
}

return M
