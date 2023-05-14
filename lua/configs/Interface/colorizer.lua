local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	filetypes = { "*" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue or blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = true, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		tailwind = true, -- Enable tailwind colors
		sass = { enable = true, parsers = { "css" } }, -- Enable sass colors

		mode = "virtualtext",
		virtualtext = "■",
		always_update = true,
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
})
