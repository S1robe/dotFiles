local lsp = require('lsp-zero')

vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)

lsp.on_attach(function(client, bufnr)
  -- Use defaults
  lsp.default_keymaps({buffer=bufnr})
end)

-- LSP Configs
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
   lsp.default_setup,
  },
})

--require("copilot").setup({
--  suggestion = { enabled = false },
--  panel = { enable = false },
--})

-- Completions 
local cmp = require('cmp')
cmp.setup({

  snippet = {
     expand = function(args)
      require('luasnip').lsp_expand(args.body)
      require('vsnip').anonymous(args.body)
     end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(
      {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }
    ),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
  }),
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'vsnip'},
    {name = 'spell'},
    {name = 'buffer'},
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[LUA]',
        spell = '[Spell]',
        copilot = '[Copilot]',
      })[entry.source.name]
      return vim_item
    end,
  },
})
