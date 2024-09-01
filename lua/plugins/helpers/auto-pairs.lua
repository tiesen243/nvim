local M = { "windwp/nvim-autopairs" }

M.config = function()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return
  end

  autopairs.setup()
end

return M
