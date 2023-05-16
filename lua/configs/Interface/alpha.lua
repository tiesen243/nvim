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
	[[                    @Tiesen226                ]],
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("w", "󰈬  Find word", ":Telescope live_grep <CR>"),
	dashboard.button("r", "  Recently opened files", ":Telescope oldfiles <CR>"),
	dashboard.button("e", "  Files Explore", ":NvimTreeFindFileToggle<CR>"),
	dashboard.button("c", "  Configuration", ":e ~/AppData/local/nvim/init.lua<CR>"),
	dashboard.button("s", "  Update plugins", ":PackerSync <CR>"),
	dashboard.button("q", "⏻  Quit", ":wqa <CR>"),
}
dashboard.section.buttons.opts = {
	spacing = 0,
	position = "center",
}

local function footer()
	return {
		[[]],
		[[]],
		[[]],
		[[]],
		[[Losers should hurry up and scram! Wa ha ha!]],
		[[                                    Duci <4]],
	}
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
