local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	filetypes = { "*" },
	user_default_options = {
		RRGGBBAA = true,
		AARRGGBB = true,
		css = true,
		tailwind = true,
		sass = { enable = true, parsers = { "css" } },

		mode = "background", -- "foreground" or "background" or "virtualtext"
		virtualtext = "■",
		always_update = true,
	},
	buftypes = { "*" },
})
-- black brown red orange yellow green blue purple gray white
