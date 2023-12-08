local lsp = require('lsp-zero').preset({
    name = 'recommended',
    suggest_lsp_servers = true,
--    ensure_installed = {
--        'html',
--        'python',
--        'java', 
--        'c', 
--        'cpp',
--        'rust',
--        'ts', 
--        'js',
--        'lua',
--        'dart',
--        'flutter',
--        'bash',
--        'powershell'
--    }
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


-- lsp.nvim_workspace()

local cmp = require('cmp')
vim.keymap.set("i", "<C-space>", cmp.mapping.complete())

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
vim.diagnostic.config({
    virtual_text = true
})
