local repeat_status, repeat_cmd = pcall(require, "vim-repeat")
if not repeat_status then
	return
end

local surround_status, surround = pcall(require, "vim-surround")
if not surround_status then
	return
end

repeat_cmd.setup({})
surround.setup({})
