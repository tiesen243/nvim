M = { "ggandor/lightspeed.nvim" }

M.config = function()
  local status_ok, lightspeed = pcall(require, "lightspeed")
  if not status_ok then
    return
  end

  lightspeed.setup({
    ignore_case = true,
  })

  vim.cmd("autocmd ColorScheme * lua require('lightspeed').init_highlight(true)")
end

return M
