local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local on_attach = function(client, bufnr) end

-- Enable auto completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
cmp_nvim_lsp.setup({ capabilities = capabilities })

-- Enable the following language servers

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
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
	filetypes = { "html", "javascriptreact", "typescriptreact", "javascript", "typescript" },
	init_options = {
		documentFormatting = true,
		["bem.enabled"] = true,
	},
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
