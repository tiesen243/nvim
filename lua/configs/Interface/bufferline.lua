local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		hover = {
			enabled = true,
			delay = 10,
			reveal = { "close" },
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
		},
		numbers = "none",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 15,
		separator_style = "thin",
		indicator = {
			icon = "▎",
			style = "icon",
		},
	},
})

vim.cmd([[
  autocmd ColorScheme * highlight BufferLineFill guibg=none
  autocmd ColorScheme * highlight BufferLineBackground guifg=none guibg=none
  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white guibg=none
]])
