local M = { "neovim/nvim-lspconfig" }

M.config = function()
	local status_ok, lspconfig = pcall(require, "lspconfig")
	if not status_ok then
		return
	end

	local status_okk, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_okk then
		return
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	cmp_nvim_lsp.setup({ capabilities = capabilities })

	local on_attach = function(_, _)
		local opts = function(desc)
			return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
		end

		vim.keymap.set("n", "<leader>l", "<nop>", opts("LSP"))
		vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code action"))
		vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
		vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Definition"))
	end

	local servers = {}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	lspconfig["lua_ls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	})
end

return M
