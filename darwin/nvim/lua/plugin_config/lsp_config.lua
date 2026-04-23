require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'pyright',
        'jsonls',
        'jdtls',
        'bashls',
        'yamlls'
    },
}

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga outline<CR>', { silent = true, buffer = bufnr })
    vim.keymap.set('n', 'O', '<cmd>Lspsaga outgoing_calls<CR>', { silent = true, buffer = bufnr })
    vim.keymap.set('n', 'I', '<cmd>Lspsaga incoming_calls<CR>', { silent = true, buffer = bufnr })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

vim.lsp.config('gopls', {
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})

vim.lsp.config('jdtls', {
    init_options = {
        settings = {
            java = {
                format = {
                    enabled = false,
                },
            },
        },
    },
})

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
        keys = {
            toggle_or_jump = 'o',
            quit = 'q',
            jump = 'e'
        }
    }
}
