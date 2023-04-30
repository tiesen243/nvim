require('bufferline').setup {
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center"
			}
		}
	}
}

vim.cmd [[
  nnoremap <silent> <leader>] :BufferLineCycleNext<CR>
  nnoremap <silent> <leader>[ :BufferLineCyclePrev<CR>
]]
