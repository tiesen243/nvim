local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ":TSUpdate"

M.config = function()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter.setup({
    auto_install = true,
    sync_install = true,
    indent = { enable = true },
    incremental_selection = { enable = true },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
  })

  vim.filetype.add({ extension = { mdx = "mdx", conf = "bash" } })
  vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

  vim.treesitter.language.register("markdown", "mdx")
  vim.treesitter.language.register("conf", "bash")
end

return M
