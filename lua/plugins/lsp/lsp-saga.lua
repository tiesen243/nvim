local M = { "nvimdev/lspsaga.nvim" }

M.config = function()
  local status_ok, saga = pcall(require, "lspsaga")
  if not status_ok then
    return
  end

  saga.setup({
    lightbulbs = {
      enabled = false,
    },
    finder = {
      default = "ref",
      keys = {
        tabnew = "<cr>",
      },
    },
    rename = {
      keys = { quit = "<C-d>" },
    },
    code_action = {
      num_shortcut = true,
      show_server_name = true,
      extend_gitsigns = true,
    },
    outline = {
      close_after_jump = false,
      keys = {
        jump = "<cr>",
      },
    },
  })
end

return M
