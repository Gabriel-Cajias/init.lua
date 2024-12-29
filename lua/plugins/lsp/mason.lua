return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = {
                'html',
                'cssls',
                'tailwindcss',
                'svelte',
                'lua_ls',
                'graphql',
                'emmet_ls',
                'prismals',
                'pyright',
                'clangd',
                'angularls',
                'ansiblels',
                'arduino_language_server',
                'asm_lsp',
                'bashls',
                'dockerls',
                'harper_ls',
                'jsonls',
            },
            automatic_instalation = true,
        })

    end,
}
