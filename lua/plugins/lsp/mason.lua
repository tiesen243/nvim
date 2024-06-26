local M = {}

local mason = { "williamboman/mason.nvim" }

mason.config = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

local mason_lspconfig = { "williamboman/mason-lspconfig.nvim" }

mason_lspconfig.config = function()
	require("mason-lspconfig").setup()
end

local lsp_signature = { "ray-x/lsp_signature.nvim" }

lsp_signature.config = function()
	require("lsp_signature").setup({
		bind = true,
		doc_lines = 2,
		floating_window = true,
		floating_window_above_cur_line = true,
		floating_window_opacity = 0.8,
		fix_pos = true,
		hint_enable = true,
		hint_prefix = "",
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 12,
		max_width = 120,
		handler_opts = { border = "rounded" },
		extra_trigger_chars = {},
		zindex = 200,
	})
end

table.insert(M, mason)
table.insert(M, mason_lspconfig)
table.insert(M, lsp_signature)

return M
