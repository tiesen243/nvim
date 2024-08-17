local M = { "williamboman/mason.nvim" }

M.dependencies = {
  "williamboman/mason-lspconfig.nvim",
}

M.config = function()
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end

  local status_okk, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not status_okk then
    return
  end

  mason.setup({
    ui = {
      icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
    },
  })

  mason_lspconfig.setup({
    ensure_installed = {
      --Lua
      "lua_ls",

      --Web Development
      "html",
      "cssls",
      "eslint",
      "emmet_ls",
      "tsserver",
      "prismals",
      "tailwindcss",

      --Python
      "pyright",

      -- Utils
      "dockerls",
    },
  })
end

return M
