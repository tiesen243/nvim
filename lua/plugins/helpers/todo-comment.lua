local M = { "folke/todo-comments.nvim" }

M.config = function()
	local status_okk, todo = pcall(require, "todo-comments")
	if not status_okk then
		return
	end

	todo.setup()
end

return M
