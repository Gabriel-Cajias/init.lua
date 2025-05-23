return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile'},
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        {'antosha417/nvim-lsp-file-operations', config = true},
    },
    config = function()
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local lspconfig = require("lspconfig")
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true}
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr
            opts.desc = 'Show LSP references'
            keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)
            opts.desc = 'Go to declaration'
            keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

            opts.desc = 'Show LSP definition'
            keymap.set('n', 'gd', '<cmd>Telescope lsp_implementations<CR>', opts)

            opts.desc = 'Show LSP type definition<CR>'
            keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

            opts.desc = 'See available code actions'
            keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            opts.desc = 'Show buffer diagnostics'
            keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

             -- opts.desc = 'Show line diagnostics'
             -- keymap.set('n', '<leader>d', vim.diagnostics.open_float, opts)

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>rs', ':LspRestart<CR', opts)
        end
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I"}
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" -- type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        
    end,
}
