local M = { "nvim-telescope/telescope.nvim" }

M.dependencies = {
  "nvim-telescope/telescope-file-browser.nvim",
}

M.lazy = false

M.config = function()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  })

  telescope.load_extension("file_browser")
end

M.keys = {
  { "<leader>f",  "<nop>",                           desc = "Telescope" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live Grep" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Help Tags" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>",     desc = "Recent Files" },
  { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
}

return M
