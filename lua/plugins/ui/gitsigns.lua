local M = { "lewis6991/gitsigns.nvim" }

M.lazy = false

M.config = function()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end

  gitsigns.setup()
end

M.keys = {
  { "<leader>g",  "<nop>",                        desc = "Git" },
  { "<leader>gb", "<cmd>Gitsigns blame<cr>",      desc = "Blame" },
  { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
}

return M
