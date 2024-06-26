local M = { "goolord/alpha-nvim" }

M.config = function()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local dashboard = require("alpha.themes.dashboard")

	-- Header --
	dashboard.section.header.val = {
		[[                                              ]],
		[[                                              ]],
		[[█████████╗██╗███████╗██████╗███████╗███╗   ██╗]],
		[[ ╚══██╔══╝██║██╔════╝██╔═══╝██╔════╝████╗  ██║]],
		[[    ██║   ██║█████╗  ██████╗█████╗  ██╔██╗ ██║]],
		[[    ██║   ██║██╔══╝  ╚═══██║██╔══╝  ██║╚██╗██║]],
		[[    ██║   ██║███████╗██████║███████╗██║ ╚████║]],
		[[    ╚═╝   ╚═╝╚══════╝╚═════╝╚══════╝╚═╝  ╚═══╝]],
		[[                                              ]],
		[[                    @tiesen243                ]],
	}

	-- Buttons --
	dashboard.section.buttons.val = {
		dashboard.button("n", "  New file", "<cmd>enew<CR>"),
		dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
		dashboard.button("w", "󰈬  Find word", "<cmd>Telescope live_grep<CR>"),
		dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
		dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/init.lua<CR>"),
		dashboard.button("q", "⏻  Quit", "<cmd>wqa<CR>"),
	}
	dashboard.section.buttons.opts = {
		spacing = 0,
		position = "center",
	}

	-- Footer --
	dashboard.section.footer.val = {
		[[                                              ]],
		[[                                              ]],
		[[                  I believe this world is flat]],
		[[                          Cuz loli is my world]],
		[[                                              ]],
		[[                                   Yukikaze <4]],
	}

	-- Configuration --
	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"
	dashboard.opts.opts.noautocmd = true

	-- Set up
	alpha.setup(dashboard.opts)
end

return M
