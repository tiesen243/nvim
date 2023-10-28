local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",
		disabled_filetypes = { "alpha", "NvimTree", "dashboard", "packer" },
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
