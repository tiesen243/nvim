local M = { "aserowy/tmux.nvim" }

M.config = function()
  local status_ok, tmux = pcall(require, "tmux")
  if not status_ok then
    return
  end

  tmux.setup({
    resize = {
      enable_default_keybindings = false
    }
  })
end

return M
