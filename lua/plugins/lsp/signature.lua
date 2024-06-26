local M = { "ray-x/lsp_signature.nvim" }

M.config = function()
	local status_ok, lsp_signature = pcall(require, "lsp_signature")
	if not status_ok then
		return
	end

	lsp_signature.setup({
		bind = true,
		doc_lines = 2,
		floating_window = true,
		floating_window_above_cur_line = true,
		floating_window_opacity = 0.8,
		fix_pos = true,
		hint_enable = true,
		hint_prefix = "",
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 12,
		max_width = 120,
		handler_opts = { border = "rounded" },
		extra_trigger_chars = {},
		zindex = 200,
	})
end

return M
