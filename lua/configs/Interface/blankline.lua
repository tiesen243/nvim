local status_ibl, ibl = pcall(require, "ibl")
if not status_ibl then
	return
end

vim.opt.list = true

ibl.setup()
