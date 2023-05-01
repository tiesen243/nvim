
local transparent_status, transparent = pcall(require, "transparent")
if not transparent_status then
  return
end
transparent.setup({
	enabled = true,
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
		"Alpha",
  },
})

local color_status, dracula = pcall(vim.cmd, "colorscheme dracula")
if not color_status then
  return
end

