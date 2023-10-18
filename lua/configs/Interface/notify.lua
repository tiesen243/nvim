local status, notify = pcall(require, "notify")
if not status then
	return
end

notify.setup({
	background_colour = "#000000",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 50,
	maximum_width = 50,
	on_open = nil,
	on_close = nil,
	opacity = 20,
	render = "default",
	stages = "slide",
	timeout = 1000,
	top_down = true,
})
