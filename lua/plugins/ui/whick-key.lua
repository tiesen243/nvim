local M = { "folke/which-key.nvim" }

M.config = function()
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  vim.o.timeout = true
  vim.o.timeoutlen = 100

  local mappings = {}
  local opts = {
    mode = { "n" },
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  wk.register(mappings, opts)

  wk.setup({
    triggers = " ",
    shows_help = false,
    ignore_missing = false,
    window = {
      winblend = 1,
      order = "rounded",
      position = "bottom",
    },
    layout = {
      spacing = 10,
      align = "center",
    },
  })
end

return M
