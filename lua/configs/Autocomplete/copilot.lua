vim.g.copilot_filetypes = { ["*"] = true }

vim.cmd([[ 
  imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
]])
