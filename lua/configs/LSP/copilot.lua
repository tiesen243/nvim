local status, copilot = pcall(require, "copilot")
if not status then
	return
end

copilot.setup({
	suggestion = { enabled = true },
	panel = { enabled = true },
})

vim.g.copilot_filetypes = { ["*"] = true }

vim.cmd([[ 
  imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
]])
