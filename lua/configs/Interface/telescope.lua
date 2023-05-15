local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, action = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = action.close,
				["<C-j>"] = action.move_selection_next,
				["<C-k>"] = action.move_selection_previous,
			},
		},
	},
	picker = {
		prompt_prefix = "🔍 ",
	},
})

vim.cmd([[highlight TelescopeNormal none]])
