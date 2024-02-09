local lsp = require('lsp-zero')

lsp.preset({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})



lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- local cmp = require('cmp')
-- vim.keymap.set("i", "<C-space>", cmp.mapping.complete())

--vim.diagnostic.config({
--    virtual_text = true
--})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})
