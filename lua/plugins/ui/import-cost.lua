local M = { "barrett-ruth/import-cost.nvim" }

M.build = "sh install.sh npm"

M.config = function()
	local status_ok, importcost = pcall(require, "import-cost")
	if not status_ok then
		return
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"alpha",
			"dashboard",
			"fzf",
			"help",
			"lazy",
			"lazyterm",
			"mason",
			"neo-tree",
			"notify",
			"toggleterm",
			"Trouble",
			"trouble",
		},
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})

	importcost.setup({ symbol = "│", options = { try_as_border = true } })
end

return M
