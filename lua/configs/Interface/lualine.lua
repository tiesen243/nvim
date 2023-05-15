local myTheme = function()
	local colors = {
		white = "#f8f8f2",
		gray = "#44475a",
		innerbg = nil,
		outerbg = "#5f6a8e",
		normal = "#bd93f9",
		insert = "#50fa7b",
		visual = "#f1fa8c",
		replace = "#e46876",
		command = "#ffb86c",
	}
	return {
		inactive = {
			a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
		visual = {
			a = { fg = colors.gray, bg = colors.visual, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
		replace = {
			a = { fg = colors.gray, bg = colors.replace, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
		normal = {
			a = { fg = colors.gray, bg = colors.normal, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
		insert = {
			a = { fg = colors.gray, bg = colors.insert, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
		command = {
			a = { fg = colors.gray, bg = colors.command, gui = "bold" },
			b = { fg = colors.white, bg = colors.outerbg },
			c = { fg = colors.white, bg = colors.innerbg },
		},
	}
end

local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = myTheme(),
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
