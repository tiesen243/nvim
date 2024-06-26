local M = { "MeanderingProgrammer/markdown.nvim" }

M.config = function()
	local status_ok, render_markdown = pcall(require, "render-markdown")
	if not status_ok then
		return
	end

	render_markdown.setup({
		file_types = { "markdown", "mdx" },
	})
end

return M
