local comment_status, comment = pcall(require, "Comment")
if not comment_status then
	return
end

comment.setup({
	ignore = "^$",
	toggler = {
		block = "<leader>/",
	},
	opleader = {
		block = "<leader>/",
	},
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
