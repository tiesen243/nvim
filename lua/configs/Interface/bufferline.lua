require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
})

vim.cmd([[
  autocmd ColorScheme * highlight BufferLineFill guibg=none
  autocmd ColorScheme * highlight BufferLineBackground guifg=none guibg=none
  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white guibg=none
]])
