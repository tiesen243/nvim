local M = { "echasnovski/mini.cursorword" }

M.config = function()
	local status_ok, cursorword = pcall(require, "minicursorword")
	if not status_ok then
		return
	end

	cursorword.setup()
end

return M
