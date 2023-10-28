local gb_status, gitblame = pcall(require, "gitblame")
if not gb_status then
	return
end

local g = vim.g

g.gitblame_enabled = false
g.gitblame_message_template = "<summary><file><date> • <author></summary>"
g.gitblame_highlight_group = "GitBlame"

gitblame.setup({ enable = true })
