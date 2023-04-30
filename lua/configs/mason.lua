require("mason").setup()
require("mason-lspconfig").setup()

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
