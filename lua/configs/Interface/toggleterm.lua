local status, terminal = pcall(require, "toggleterm")
if not status then
	return
end

vim.g.toggleterm_shell = "powershell"

terminal.setup({
	direction = "float",
	persist_size = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 1,
	start_in_insert = true,
	auto_scoll = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		width = 90,
		height = 20,
		zindex = 6969,
		winblend = 0,
	},
	winbar = {
		enabled = false,
		name_formatter = function(term)
			return term.name
		end,
	},
})
