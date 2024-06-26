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
		vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
		vim.keymap.set("n", "<leader>lF", "<cmd>lua vim.lsp.buf.format()<cr>", opts("Format"))
		vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("Hover docs"))
		vim.keymap.set("n", "<leader>lf", "<cmd>Telescope lsp_references<cr>", opts("References"))
		vim.keymap.set("n", "<leader>ld", "<cmd>Trouble diagnostics toggle<cr>", opts("Diagnostics"))
		vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code action"))
		vim.keymap.set("n", "<leader>lg", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Go to definition"))
		vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Signature help"))
	end

	local servers = { "html", "tailwindcss", "eslint", "prismals", "pyright", "dockerls" }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	lspconfig["tsserver"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "typescript-language-server", "--stdio" },
		commands = {
			OrganizeImports = {
				function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "Organize Imports",
					}
					vim.lsp.buf.execute_command(params)
				end,
			},
		},
	})

	lspconfig["cssls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = { css = { validate = true, lint = { unknownAtRules = "ignore" } } },
	})

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
