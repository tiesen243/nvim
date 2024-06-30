local M = { "echasnovski/mini.indentscope" }

M.config = function()
  local status_ok, indent = pcall(require, "mini.indentscope")
  if not status_ok then
    return
  end

  indent.setup()

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("yuki_disable_miniindentscope", { clear = true }),
    pattern = { "help", "alpha", "dashboard", "NvimTree", "lazy", "mason" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

return M
