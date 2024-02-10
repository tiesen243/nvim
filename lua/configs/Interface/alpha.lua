local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

alpha.setup(require("alpha.themes.startify").config)
alpha.setup(require("alpha.themes.dashboard").config)

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[█████████╗██╗███████╗██████╗███████╗███╗   ██╗]],
	[[ ╚══██╔══╝██║██╔════╝██╔═══╝██╔════╝████╗  ██║]],
	[[    ██║   ██║█████╗  ██████╗█████╗  ██╔██╗ ██║]],
	[[    ██║   ██║██╔══╝  ╚═══██║██╔══╝  ██║╚██╗██║]],
	[[    ██║   ██║███████╗██████║███████╗██║ ╚████║]],
	[[    ╚═╝   ╚═╝╚══════╝╚═════╝╚══════╝╚═╝  ╚═══╝]],
	[[                                              ]],
	[[                    @tiesen243                ]],
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", "<cmd>ene<CR>"),
	dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("w", "󰈬  Find word", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("e", "  Files Explore", "<cmd>NvimTreeFindFileToggle<CR>"),
	dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/init.lua<CR>"),
	dashboard.button("s", "  Update plugins", "<cmd>PackerSync<CR>"),
	dashboard.button("q", "⏻  Quit", "<cmd>wqa<CR>"),
}
dashboard.section.buttons.opts = {
	spacing = 0,
	position = "center",
}

dashboard.section.footer.val = {
	[[                                              ]],
	[[                                              ]],
	[[                                              ]],
	[[                                              ]],
	[[                            Code in, Bugs out!]],
	[[                                   Yukikaze <4]],
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
