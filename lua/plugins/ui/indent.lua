local M = { "echasnovski/mini.indentscope" }

M.config = function()
  local status_ok, indent = pcall(require, "mini.indentscope")
  if not status_ok then
    return
  end

  indent.setup()
end

return M
