local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[█████████╗██╗███████╗██████╗███████╗███╗   ██╗]],
	[[ ╚══██╔══╝██║██╔════╝██╔═══╝██╔════╝████╗  ██║]],
	[[    ██║   ██║█████╗  ██████╗█████╗  ██╔██╗ ██║]],
	[[    ██║   ██║██╔══╝  ╚═══██║██╔══╝  ██║╚██╗██║]],
	[[    ██║   ██║███████╗██████║███████╗██║ ╚████║]],
	[[    ╚═╝   ╚═╝╚══════╝╚═════╝╚══════╝╚═╝  ╚═══╝]]
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/AppData/local/nvim/init.lua <CR>"),
	dashboard.button("s", "  Update plugins", ":PackerSync <CR>"),
	dashboard.button("q", "  Quit", ":qa <CR>")
}
dashboard.section.buttons.opts = {
	spacing = 0,
	position = "center"
}

local function footer()
	return "ゆきぬ"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
