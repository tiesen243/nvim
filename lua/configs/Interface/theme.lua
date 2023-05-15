-- Themes
local color_status, dracula = pcall(require, "dracula")
if not color_status then
	return
end

dracula.setup({
	transparent_bg = true,
	italic_comment = true,
	show_end_of_buffer = true,
})
vim.cmd([[colorscheme dracula-soft]])

-- Transparent background
local transparent_status, transparent = pcall(require, "transparent")
if not transparent_status then
	return
end

transparent.setup({
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = { "NormalFloat", "NvimTreeNormal" },
	exclude_groups = {},
})
