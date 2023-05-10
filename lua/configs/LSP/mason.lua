local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		-- Lua
		"lua_ls",
		-- Python
		"pyright",
		-- Web
		"html",
		"cssls",
		"tailwindcss",
		"tsserver",
		-- C++
		"clangd",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		-- Javascript
		"prettier",
		"eslint_d",
		-- Lua
		"stylelua",
		-- Python
		"black",
		"flake8",
		-- C++
		"clang_format",
		"cpplint",
	},
})
