local M = { "folke/trouble.nvim" }

M.config = function()
	local status_ok, trouble = pcall(require, "trouble")
	if not status_ok then
		return
	end

	trouble.setup({})
end

return M
