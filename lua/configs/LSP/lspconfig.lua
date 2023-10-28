local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local sig_status, signature = pcall(require, "lsp_signature")
if not sig_status then
	return
end

local cmp_nvim_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_status then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
cmp_nvim_lsp.setup({ capabilities = capabilities })

-- Signature
signature.setup({
	bind = true,
	doc_lines = 2,
	floating_window = true,
	floating_window_above_cur_line = true,
	floating_window_opacity = 0.8,
	fix_pos = true,
	hint_enable = true,
	hint_prefix = " ",
	hint_scheme = "String",
	hi_parameter = "Search",
	max_height = 12,
	max_width = 120,
	handler_opts = { border = "rounded" },
	extra_trigger_chars = {},
	zindex = 200,
})

-- Enable the following language servers
local servers = { "tailwindcss", "emmet_ls", "pyright", "clangd" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig.tsserver.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	commands = {
		OrganizeImports = {
			function()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end,
		},
	},
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	settings = { css = { validate = true, lint = { unknownAtRules = "ignore" } } },
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
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

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
