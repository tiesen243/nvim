local Comment_status, Comment = pcall(require, "Comment")
if not Comment_status then
	return
end

vim.g.skip_ts_context_commentstring_module = true

Comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "<C-/>",
		block = "<C-S-/>",
	},
	opleader = {
		line = "<C-/>",
		block = "<C-S-/>",
	},
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil

		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.motion == U.cmotion.v or ctx.cmotion == U.cmotion.v then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
