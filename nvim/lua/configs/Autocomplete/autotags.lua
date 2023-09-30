local status, autotags = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotags.setup()
