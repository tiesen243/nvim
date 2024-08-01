local M = { "m4xshen/autoclose.nvim" }

M.config = function()
  local status_ok, autoclose = pcall(require, "autoclose")
  if not status_ok then
    return
  end

  autoclose.setup()
end

return M
