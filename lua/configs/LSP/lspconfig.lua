local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local on_attach = function(_, bufnr)
	bufnr.formatting_sync = true
end

-- Enable auto completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
cmp_nvim_lsp.setup({ capabilities = capabilities })

-- Enable the following language servers
local servers = { "cssls", "tsserver", "tailwindcss", "emmet_ls", "pyright", "clangd", "lua_ls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
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
end

-- elseif lsp == "tsserver" then
--      cmd = { "typescript-language-server", "--stdio" },
--      commands = {
--        OrganizeImports = {
--          function()
--            local params = {
--              command = "_typescript.organizeImports",
--              arguments = { vim.api.nvim_buf_get_name(0) },
--              title = "Organize Imports",
--            }
--            vim.lsp.buf.execute_command(params)
--          end,
--        },
--      },
--    end
-- --
--  if lsp == "lua_ls" then
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim" },
--           },
--           workspace = {
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
