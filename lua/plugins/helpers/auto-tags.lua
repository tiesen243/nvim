local M = { "windwp/nvim-ts-autotag" }

M.config = function()
	local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
	if not autotag_status then
		return
	end

	autotag.setup({ enable = true, update_events = "InsertLeave" })

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "",
			spacing = 5,
			min = "severity",
		},
		signs = true,
		underline = true,
		update_in_insert = true,
	})
end

return M
