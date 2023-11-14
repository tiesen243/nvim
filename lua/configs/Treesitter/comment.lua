local Comment_status, Comment = pcall(require, "Comment")
if not Comment_status then
	return
end
Comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "<Leader>/",
	},
	opleader = {
		line = "<Leader>/",
	},
	mappings = {
		basic = true,
		extra = true,
	},
	pre_hook = function(...)
		local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
		if loaded and ts_comment then
			return ts_comment.create_pre_hook()(...)
		end
	end,
	post_hook = nil,
})
