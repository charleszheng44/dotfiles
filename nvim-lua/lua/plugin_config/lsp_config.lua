require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls' },
}

local on_attach = function(_, _) 
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig').gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
