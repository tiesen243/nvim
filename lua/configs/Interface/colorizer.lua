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

		mode = "virtualtext", -- "foreground" or "background" or "virtualtext"
		virtualtext = "■",
		always_update = true,
	},
	buftypes = { "*" },
})
