local spectre_status, spectre = pcall(require, "spectre")
if not spectre_status then
	return
end

require("spectre.actions").get_current_entry()
require("spectre.actions").get_all_entries()
require("spectre.actions").get_state()

spectre.setup({
	is_insert_mode = true,
	is_block_ui_break = true,
	live_update = true,
	default = {
		replace = {
			cmd = "sed",
		},
	},
	mapping = {
		["run_current_replace"] = {
			map = "r",
			cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
			desc = "replace current line",
		},
		["run_replace"] = {
			map = "R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all",
		},
	},
})
