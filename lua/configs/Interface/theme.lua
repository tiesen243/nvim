local transparent_status, transparent = pcall(require, "transparent")
if not transparent_status then
	return
end
transparent.setup({
	enabled = true,
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal",
		"Alpha",
	},
})

local color_status, dracula = pcall(require, "dracula")
if not color_status then
	return
end
dracula.setup({
	transparent_bg = true,
	italic_comment = true,
})
vim.cmd([[colorscheme dracula]])
