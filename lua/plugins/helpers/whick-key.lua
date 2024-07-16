local M = { "folke/which-key.nvim" }

M.config = function()
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  wk.setup({
    ---@type false | "classic" | "modern" | "helix"
    preset = "modern",

    modes = {
      n = true,  -- Normal mode
      i = false, -- Insert mode
      x = false, -- Visual mode
      s = false, -- Select mode
      o = false, -- Operator pending mode
      t = false, -- Terminal mode
      c = false, -- Command mode
    },

    win = {
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      row = -1,
      border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        winblend = 1, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 4,          -- spacing between columns
      align = "center",     -- align columns left, center or right
    },
  })
end

return M
