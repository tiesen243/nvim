local M = { "aserowy/tmux.nvim" }

M.lazy = false

M.config = function()
  local status_ok, tmux = pcall(require, "tmux")
  if not status_ok then
    return
  end

  tmux.setup({
    resize = {
      enable_default_keybindings = false,
    },
  })
end

M.keys = {
  { "<C-Up>",    "<cmd>lua require('tmux').resize_top()<cr>",    desc = "Increase Window Height" },
  { "<C-Left>",  "<cmd>lua require('tmux').resize_left()<cr>",   desc = "Decrease Window Width" },
  { "<C-Right>", "<cmd>lua require('tmux').resize_right()<cr>",  desc = "Increase Window Width" },
  { "<C-Down>",  "<cmd>lua require('tmux').resize_bottom()<cr>", desc = "Decrease Window Height" },
}

return M
