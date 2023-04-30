local wk = require("which-key")

local mappings = {
	q = { ":q <CR>", "Quit" },
	Q = { ":wq <CR>", "Save and Quit" },
	e = { ":NvimTreeToggle <CR>", "Explorer" },
	c = { ":e ~/AppData/Local/nvim/init.lua <CR>", "Configuartion" },
	b = { ":CommentToggle <CR>", "Comment" },
	s = { ":w <CR>", "Save" },
	f = {
		name = "File",
		f = { ":Telescope find_files <CR>", "Find Files" },
		b = { ":Telescope buffers <CR>", "Find Buffers" },
		g = { ":Telescope live_grep <CR>", "Find Grep" },
		r = { "require('telescope.builtin').lsp_references, {}", "Find References" },
		m = { ":lua vim.lsp.buf.format() <CR>", "Format" }
	},
	g = {
		name = "Git",
		i = { ":!Git init <CR>", "Init" },
		a = { ":!Git add . <CR>", "Add File" },
		c = { ":!Git commit -m 'nothing' <CR>", "Commit" },
		p = { ":!Git push <CR>", "Push" },
		P = { ":!Git pull <CR>", "Pull" },
	},
	h = {
		name = "Packer",
		s = { ":PackerSync <CR>", "Sync" },
		i = { ":PackerInstall <CR>", "Install" },
		u = { ":PackerUpdate <CR>", "Update" },
		l = { ":PackerLoad <CR>", "Load" },
		C = { ":PackerClean <CR>", "Clean" },
		c = { ":PackerCompile <CR>", "Compile" },
		p = { ":PackerProfile <CR>", "Profile" },
		S = { ":PackerStatus <CR>", "Status" },
	},
	D = {
		name = "LSP",
		d = { ":vim.lsp.buf.type_definition", "Type Definition" },
		n = { ":vim.lsp.buf.rename", "Rename" },
		a = { ":vim.lsp.buf.code_action", "Code Action" },
		r = { ":vim.lsp.buf.references", "References" },
		i = { ":vim.lsp.buf.implementation", "Implementation" },
	},
	w = {
		name = "Workspace",
		a = { ":lua vim.lsp.buf.add_workspace_folder()", "Add Folder" },
		r = { ":lua vim.lsp.buf.remove_workspace_folder()", "Remove Folder" },
		l = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))", "List Folder" },
	}

}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
}

wk.register(mappings, opts)
