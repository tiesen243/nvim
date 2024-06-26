local M = { "xiyaowong/transparent.nvim" }

M.config = function()
  local status_ok, transparent = pcall(require, "transparent")
  if not status_ok then
    return
  end

  transparent.setup({
    extra_groups = { "NormalFloat", "NvimTreeNormal" },
    exclude_groups = { "CursorLine" },
  })

  transparent.clear_prefix("NeoTree")
  transparent.clear_prefix("BufferLine")

  vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
  vim.g.transparent_groups = vim.list_extend(
    vim.g.transparent_groups or {},
    vim.tbl_map(function(v)
      return v.hl_group
    end, vim.tbl_values(require("bufferline.config").highlights))
  )
end

return M
