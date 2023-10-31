local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_status then
	return
end

autotag.setup({
	filetypes = {
		"html",
		"typescriptreact",
	},
	enable = true,
	update_events = "InsertLeave",
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "",
		spacing = 5,
		severity_limit = "Warning",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})
