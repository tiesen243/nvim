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
		border = "rounded",
		width = 0.8,
		height = 0.69,
		check_outdated_packages_on_open = true,
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
		"emmet_ls",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		-- Javascript
		"prettier",
		"eslint_d",
		-- Lua
		"stylua",
		-- Python
		"black",
		"flake8",
	},
})
