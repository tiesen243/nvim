local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	source = {
		-- Formatting
		formatting.prettier,
		formatting.astyle,
		formatting.black,
		formatting.stylua,
		-- Diagnostics
		diagnostics.eslint_d,
		diagnostics.cpplint,
		diagnostics.flake8,
	},

	-- Format on save
	on_attach = function(currrent_client, bufnr)
		if currrent_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmds(BufWritePre, {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync({
						filter = function(client)
							return client.name ~= "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
