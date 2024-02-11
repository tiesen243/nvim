local status_ibl, ibl = pcall(require, "ibl")
if not status_ibl then
	return
end

local status_hooks, hooks = pcall(require, "ibl.hooks")
if not status_hooks then
	return
end

local colors = require("dracula").colors()

local highlight = {
	"RainbowRed",
	"RainbowGreen",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowMagenta",
	"RainbowCyan",
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.bright_red })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.bright_green })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.bright_yellow })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.bright_blue })
	vim.api.nvim_set_hl(0, "RainbowMagenta", { fg = colors.bright_magenta })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.bright_cyan })
	vim.api.nvim_set_hl(0, "RainbowWhite", { fg = colors.bright_white })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
ibl.setup({ indent = { highlight = highlight }, scope = { highlight = { "RainbowWhite" } } })

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
