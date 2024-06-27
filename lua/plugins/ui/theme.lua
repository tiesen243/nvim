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
      darken = { floats = true },
      styles = {
        comments = "NONE",
        conditionals = "NONE",
        constants = "bold",
        functions = "bold",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "italic",
        variables = "NONE",
      },
    },
  })

  vim.cmd([[colorscheme github_dark_default]])
end

return M
