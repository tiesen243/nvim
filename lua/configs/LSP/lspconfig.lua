local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable the following language servers
local servers = { "cssls", "tsserver", "tailwindcss", "emmet_ls", "pyright", "clangd", "lua_ls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		init_options = {
			documentFormatting = true,
		},

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
end
