local M = { "VonHeikemen/fine-cmdline.nvim" }

M.config = function()
	local status_ok, fine_cmdline = pcall(require, "fine-cmdline")
	if not status_ok then
		return
	end

	fine_cmdline.setup({
		cmdline = { prompt = " " },
	})
end

M.keys = {
	{ ":", "<cmd>FineCmdline<cr>", desc = "Fine Cmdline" },
}

return M
