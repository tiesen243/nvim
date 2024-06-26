local M = { "stevearc/conform.nvim" }

M.config = function()
	local status_ok, conform = pcall(require, "conform")
	if not status_ok then
		return
	end

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			["*"] = { "prettier" },
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
