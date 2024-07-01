local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-emoji",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  { "L3MON4D3/LuaSnip", run = "make install_jsregexp" },
}

M.config = function()
  local status_ok, cmp = pcall(require, "cmp")
  if not status_ok then
    return
  end

  local status_okk, luasnip = pcall(require, "luasnip")
  if not status_okk then
    return
  end

  local status_okkk, lspkind = pcall(require, "lspkind")
  if not status_okkk then
    return
  end

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-k>"] = cmp.mapping.scroll_docs(-4),
      ["<C-j>"] = cmp.mapping.scroll_docs(4),

      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-S-Space>"] = cmp.mapping.close(),

      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },

    sources = {
      { name = "path" },
      { name = "emoji" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
    },
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = "",
      }),
    },
  })

  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

  lspkind.init({ mode = "symbol" })
end

return M
