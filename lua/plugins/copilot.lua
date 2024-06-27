local M = { "CopilotC-Nvim/CopilotChat.nvim" }

M.lazy = false

M.branch = "canary"

M.dependencies = { "github/copilot.vim" }

M.config = function()
	local status_ok, CopilotChat = pcall(require, "CopilotChat")
	if not status_ok then
		return
	end

	CopilotChat.setup({
		debug = true,
		window = {
			layout = "float",
			title = "Copilot Chat",
		},
	})
end

M.keys = {
	{ "<leader>c", "<nop>", desc = "Copilot" },
	{ "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
	{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
	{ "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Review code" },
	{ "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix bug" },
	{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize code" },
	{ "<leader>cd", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
	{ "<leader>cc", "<cmd>CopilotChatCommit<cr>", desc = "Suggest commit message" },
	{ "<leader>cs", "<cmd>CopilotChatCommitStaged<cr>", desc = "Suggest commit stage message" },
}

return M
