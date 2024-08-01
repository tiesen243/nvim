local M = { "akinsho/bufferline.nvim" }

M.lazy = false

M.config = function()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  bufferline.setup({
    options = {
      max_name_length = 15,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center",
        },
      },
    },
  })
end

M.keys = {
  { "<Tab>",      "<cmd>BufferLineCycleNext<cr>",  desc = "Next tab" },
  { "<S-Tab>",    "<cmd>BufferLineCyclePrev<cr>",  desc = "Prev tab" },
  { "<leader>bp", "<cmd>BufferLinePick<cr>",       desc = "Pick tab" },
  { "<leader>b",  "<nop>",                         desc = "Bufferline" },
  { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>",  desc = "Close Left" },
  { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right" },
  { "<leader>bc", "<cmd>BufferLinePickClose<cr>",  desc = "Pick & Close tab" },
}

return M
