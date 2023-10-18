local status, autotags = pcall(require, "nvim-ts-autotags")
if not status then
	return
end

autotags.setup()
