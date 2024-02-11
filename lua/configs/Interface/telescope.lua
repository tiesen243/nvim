local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, action = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions

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
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

vim.cmd([[highlight TelescopeNormal none]])
