local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- Load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "",
    })
  }
})

