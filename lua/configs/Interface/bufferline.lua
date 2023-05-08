require("bufferline").setup({

	options = {
		indicator_icon = " ",
		separator_style = { "", "" },
		tab_size = 0,
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
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
  autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e
  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white gui=none
]])
