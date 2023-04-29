vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
vim.g.copilot_filetype = {["*"] = true}
vim.cmd[[imap <silent><script><expr> <Tab> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true


