local M = { "razak17/tailwind-fold.nvim" }

M.config = function()
  local status_ok, twfold = pcall(require, "tailwind-fold")
  if not status_ok then
    return
  end

  twfold.setup()
end

return M
