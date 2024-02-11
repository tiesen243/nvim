-- Themes
local dracula_status, dracula = pcall(require, "dracula")
if not dracula_status then
	return
end

dracula.setup({
	transparent_bg = true,
	italic_comment = true,
	show_end_of_buffer = true,
	lualine_bg_color = "nil",
})

vim.cmd([[colorscheme dracula]])
