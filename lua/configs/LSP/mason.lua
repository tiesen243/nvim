local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	PATH = "prepend",
})
mason_lsp.setup({
	ensure_installed = {
		-- Lua
		"lua_ls",
		-- Python
		"pyright",
		-- C/C++
		"clangd",
		-- Web
		"tsserver",
		"eslint",
		"html",
		"cssls",
		"tailwindcss",
	},
})

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, {})
end
require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', "feedkey" }
			}
		}
	}
}

mason_null_ls.setup({
	ensure_installed = {
		-- JS
		"prettier",
		"eslint_d",
		-- C/C++, Arduino
		"astyle",
		"cpplint",
		-- Python
		"black",
		"flake8",
		-- Lua
		"stylua",
	}
})
