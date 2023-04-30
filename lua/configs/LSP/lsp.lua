local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
	return
end

local typescript_status, typescript = pcall(require, 'typescript')
if not typescript_status then
	return
end

local keymap = vim.keymap
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Set Keybinds
	keymap.set('n', '<leader>Df', ":Lspsaga lsp_finder<CR>", opts)
	keymap.set('n', '<leader>DD', ":lua vim.lsp.buf.definition()<CR>", opts)
	keymap.set('n', '<leader>Dd', ":Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set('n', '<leader>Dd', ":Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set('n', '<leader>Di', ":lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set('n', '<leader>Da', ":lua vim.lsp.buf.code_action()<CR>", opts)
	keymap.set('n', '<leader>Dr', ":Lspsaga rename<CR>", opts)
	keymap.set('n', '<leader>Dk', ":Lspsaga hover_doc<CR>", opts)
	keymap.set('n', '<leader>Do', ":LSoutlineToggle<CR>", opts)

	if client.name == "tsserver" then
		keymap.set('n', '<leader>Dn', ":TypescriptRenameFile<CR>", opts)
	end
end

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<leader>fm', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- HTML
lspconfig["html"].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Typescript
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach
	}
})

-- CSS
lspconfig["cssls"].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig["tailwindcss"].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Lua
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- C/C++
lspconfig["clangd"].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Python
lspconfig["pyright"].setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
