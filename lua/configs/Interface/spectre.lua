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
		["change_view_mode"] = {
			map = "v",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "change result view mode",
		},
		["replace_cmd"] = {
			map = "c",
			cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
			desc = "input replace command",
		},
		["show_option_menu"] = {
			map = "o",
			cmd = "<cmd>lua require('spectre').show_options()<CR>",
			desc = "show options",
		},
		["resume_last_search"] = {
			map = "l",
			cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
			desc = "repeat last search",
		},
		["send_to_qf"] = {
			map = "q",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "send all items to quickfix",
		},
	},
})
