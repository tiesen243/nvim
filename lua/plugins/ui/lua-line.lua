local M = { "nvim-lualine/lualine.nvim" }

M.config = function()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	lualine.setup({
		options = {
			disabled_filetypes = { "alpha", "NvimTree", "dashboard" },
		},
		sections = { lualine_a = { { "filename", path = 1 } } },
	})
end

return M
