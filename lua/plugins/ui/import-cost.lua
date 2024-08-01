local M = { "barrett-ruth/import-cost.nvim" }

M.build = "sh install.sh npm"

M.config = function()
  local status_ok, importcost = pcall(require, "import-cost")
  if not status_ok then
    return
  end

  importcost.setup({ symbol = "│", options = { try_as_border = true } })
end

return M
