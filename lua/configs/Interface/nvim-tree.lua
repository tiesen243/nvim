local setup, tree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#5f5faf ]])

tree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          default = "",
          open = "",
          symlink = "",
          arrow_closed = "",
          arrow_open = "", 
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
})

