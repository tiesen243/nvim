local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local km = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	km.set("n", "<leader>lgf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	km.set("n", "<leader>lgd", "<cmd>Lspsaga peek_definition<CR>", opts)
	km.set("n", "<leader>lgD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	km.set("n", "<leader>lgi", "<cmd>Lspsaga implementation<CR>", opts)

	km.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts)
	km.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)

	km.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	km.set("n", "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	km.set("n", "<leader>lK", "<cmd>Lspsaga hover_doc<CR>", opts)

	km.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)
end

-- Enable auto completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Web
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
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

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "pug" },
	init_options = {
		documentFormatting = true,
		["bem.enabled"] = true,
	},
})

-- C/C++
lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	offsetEncoding = { "utf-8", "utf-16" },
})

-- Python
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
