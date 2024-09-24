local M = { "CopilotC-Nvim/CopilotChat.nvim" }

M.lazy = false

M.branch = "canary"

M.dependencies = { "github/copilot.vim" }

M.config = function()
  local status_ok, CopilotChat = pcall(require, "CopilotChat")
  if not status_ok then
    return
  end

  require("CopilotChat.integrations.cmp").setup()

  CopilotChat.setup({
    window = {
      layout = "float",
      title = "Copilot Chat",
    },
    mappings = {
      complete = {
        insert = "",
      },
    },
  })
end

M.keys = {
  { "<leader>gc",  "<nop>",                             desc = "Copilot" },
  { "<leader>gct", "<cmd>CopilotChatToggle<cr>",        desc = "Toggle Copilot Chat" },
  { "<leader>gce", "<cmd>CopilotChatExplain<cr>",       desc = "Explain code" },
  { "<leader>gcr", "<cmd>CopilotChatReview<cr>",        desc = "Review code" },
  { "<leader>gcf", "<cmd>CopilotChatFix<cr>",           desc = "Fix bug" },
  { "<leader>gco", "<cmd>CopilotChatOptimize<cr>",      desc = "Optimize code" },
  { "<leader>gcd", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
  { "<leader>gcc", "<cmd>CopilotChatCommit<cr>",        desc = "Suggest commit message" },
  { "<leader>gcs", "<cmd>CopilotChatCommitStaged<cr>",  desc = "Suggest commit stage message" },
  {
    "<leader>gcp",
    function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
    end,
    desc = "CopilotChat - Prompt actions",
  },
}

return M
