local status_bl, blankline = pcall(require, "indent_blankline")
if not status_bl then
	return
end

vim.opt.termguicolors = true
vim.opt.list = false
vim.g.indent_blankline_show_current_context = true
vim.cmd([[highlight IndentBlanklineContextChar guifg=#ffffff gui=nocombine]])

blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	filetype_exclude = { "alpha", "packer", "NvimTree", "mason", "help" },
})
