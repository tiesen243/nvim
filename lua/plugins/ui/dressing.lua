local M = { "stevearc/dressing.nvim" }

M.setup = function()
	local status_ok, dressing = pcall(require, "dressing")
	if not status_ok then
		return
	end

	dressing.setup({})
end

return M
