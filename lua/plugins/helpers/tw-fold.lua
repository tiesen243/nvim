local M = { "razak17/tailwind-fold.nvim" }

M.lazy = false

M.config = function()
  local status_ok, twfold = pcall(require, "tailwind-fold")
  if not status_ok then
    return
  end

  twfold.setup()
end

M.keys = {
  { "<C-f>", "<cmd>TailwindFoldToggle<cr>", desc = "Toggle Tailwind Fold" },
}

return M
