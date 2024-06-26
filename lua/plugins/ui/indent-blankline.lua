local M = { "lukas-reineke/indent-blankline.nvim" }

M.config = function()
	local status_ok, ibl = pcall(require, "ibl")
	if not status_ok then
		return
	end

	local hooks = require("ibl.hooks")
	local highlight = { "Active" }

	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "Active", { fg = "#6273AC" })
	end)

	vim.g.rainbow_delimiters = { highlight = highlight }
	ibl.setup({ scope = { highlight = highlight } })
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
