local status, terminal = pcall(require, "toggleterm")
if not status then
	return
end

terminal.setup({
	direction = "float",
	persist_size = true,
	start_in_insert = true,
	auto_scoll = true,
	float_opts = {
		border = "curved",
		width = 90,
		height = 20,
		zindex = 6969,
		winblend = 0,
	},
})
