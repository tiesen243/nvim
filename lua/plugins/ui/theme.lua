local M = { "projekt0n/github-nvim-theme" }

M.lazy = false
M.priority = 1000

M.config = function()
  local status_ok, github = pcall(require, "github-theme")
  if not status_ok then
    return
  end

  github.setup({
    options = {
      transparent = vim.g.transparent_enabled,
      dim_inactive = true,
      darken = { floats = false },
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
      modules = {
        whichkey = { enable = true, background = false },
      }
    },
  })

  vim.cmd([[colorscheme github_dark_default]])
end

return M
