local M = { "numToStr/Comment.nvim" }

M.dependencies = {
  "JoosepAlviste/nvim-ts-context-commentstring",
}

M.config = function()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  local status_okk, ts_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
  if not status_okk then
    return
  end

  vim.g.skip_ts_context_commentstring_module = true

  comment.setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = "<C-/>",
      block = "<C-S-/>",
    },
    opleader = {
      line = "<C-/>",
      block = "<C-S-/>",
    },
    pre_hook = ts_commentstring.create_pre_hook(),
  })
end

return M
