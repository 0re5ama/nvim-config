local cmp = require 'cmp'

cmp.setup {
    view = 'native',
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'path' },                                       -- file paths
        { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
        { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
        { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
        { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
        { name = 'calc' },                                       -- source for math calculation
    }),
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                calc = '+',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', 'r!', 'read' },
            }
        }
    })
})

-- Text = "",
-- Method = "",
-- Function = "",
-- Constructor = "",
-- Field = "ﰠ",
-- Variable = "",
-- Class = "ﴯ",
-- Interface = "",
-- Module = "",
-- Property = "ﰠ",
-- Unit = "塞",
-- Value = "",
-- Enum = "",
-- Keyword = "",
-- Snippet = "",
-- Color = "",
-- File = "",
-- Reference = "",
-- Folder = "",
-- EnumMember = "",
-- Constant = "",
-- Struct = "פּ",
-- Event = "",
-- Operator = "",
-- TypeParameter = "",

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('lspconfig')['c#'].setup {
--     capabilities = capabilities
-- }

local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/xer0/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
require('lspconfig')['omnisharp'].setup {
    on_attach = on_attach,
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
}

require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
}

vim.g.cmp_debug = true
