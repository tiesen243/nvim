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

	local on_attach = function(client, _)
		local opts = function(desc)
			return { noremap = true, silent = true, expr = false, nowait = false, desc = desc }
		end

		vim.keymap.set("n", "<leader>l", "<nop>", opts("LSP"))
		vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts("Rename"))
		vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", opts("Restart LSP"))
		vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts("Outline"))
		vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", opts("References"))
		vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", opts("Hover docs"))
		vim.keymap.set("n", "<leader>lt", "<cmd>Lspsaga term_toggle<cr>", opts("Terminal"))
		vim.keymap.set("n", "<leader>lF", "<cmd>lua vim.lsp.buf.format()<cr>", opts("Format"))
		vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts("Code action"))
		vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Signature help"))
		vim.keymap.set("n", "<leader>lg", "<cmd>Lspsaga goto_definition<cr>", opts("Goto definition"))
		vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", opts("Peak definition"))
		vim.keymap.set("n", "<leader>l[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts("Prev diagnostic"))
		vim.keymap.set("n", "<leader>l]", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts("Next diagnostic"))
		vim.keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", opts("Line Diagnostics"))

		if client.name == "pyright" then
			vim.keymap.set("n", "<leader>lc", "<nop>", opts("Conda"))
			vim.keymap.set("n", "<leader>lca", "<cmd>CondaActivate<cr>", opts("Conda Activate"))
			vim.keymap.set("n", "<leader>lcd", "<cmd>CondaDeactivate<cr>", opts("Conda Deactivate"))
		end
	end

	local servers =
		{ "html", "emmet_ls", "tailwindcss", "eslint", "prismals", "pyright", "rust_analyzer", "dockerls", "hyprls" }
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
