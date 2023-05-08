require("bufferline").setup({

	options = {
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
				padding = 1,
			},
		},
	},
})

vim.cmd([[ 
  autocmd ColorScheme * highlight BufferLineFill guibg=none
  autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e
  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white gui=none
]])
