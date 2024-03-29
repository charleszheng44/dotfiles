require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'pyright', 'jsonls', 'jdtls', 'bashls', 'yamlls' },
}

local on_attach = function(_, _)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {})
    vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga outline<CR>', { silent = true })
    vim.keymap.set('n', 'O', '<cmd>Lspsaga outgoing_calls<CR>', { silent = true })
    vim.keymap.set('n', 'I', '<cmd>Lspsaga incoming_calls<CR>', { silent = true })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true
            },
        },
    }
}
require('lspconfig').jdtls.setup {
    capabilities = capabilities,
    init_options = {
        settings = {
            java = {
                format = {
                    enabled = false
                }
            }
        }
    }
}

require('lspconfig').jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspsaga').setup {
    code_action_prompt = {
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = false
    },
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' > ',
        show_file = true,
        file_formatter = ""
    },
    outline = {
        -- auto_preview = false,
        keys = {
            toggle_or_jump = 'o',
            quit = 'q',
            jump = 'e'
        }
    }
}
