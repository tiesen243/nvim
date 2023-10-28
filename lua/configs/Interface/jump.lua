local numb_status, numb = pcall(require, "numb")
if not numb_status then
	return
end

numb.setup({
	show_numbers = true,
	show_cursorline = true,
})
