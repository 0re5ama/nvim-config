return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-calc',
        'onsails/lspkind.nvim',
    },
    event = "ModeChanged",
    config = function()
        local cmp = require 'cmp'

        local icons = {
            Text = '󰊄',
            Method = '󰊕',
            Function = '󰡱',
            Constructor = '',
            Field = '',
            Variable = '󰫧',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '󰎠',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = '',
        }

        cmp.setup {
            view = cmp.config.window.bordered(),
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
                { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
                -- { name = 'cmp_tabnine' },                                -- file paths
                { name = 'path' },                                       -- file paths
                { name = 'nvim_lsp',               keyword_length = 2 }, -- from language server
                { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
                { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'crates',                 keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
                { name = 'calc' },                                       -- source for math calculation
            }),
            --[[
            formatting = {
                format = function(entry, vim_item)
                    local lspkind = require('lspkind')

                    local source_mapping = {
                        cmp_tabnine = '|',
                        nvim_lsp = 'λ',
                        vsnip = '⋗',
                        buffer = 'Ω',
                        path = '🖫',
                        calc = '+',
                    }

                    -- if you have lspkind installed, you can use it like
                    -- in the following line:
                    vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
                    vim_item.menu = source_mapping[entry.source.name]
                    if entry.source.name == "cmp_tabnine" then
                        local detail = (entry.completion_item.labelDetails or {}).detail
                        vim_item.kind = ""
                        if detail and detail:find('.*%%.*') then
                            vim_item.kind = vim_item.kind .. ' ' .. detail
                        end

                        if (entry.completion_item.data or {}).multiline then
                            vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                        end
                    end
                    local maxwidth = 80
                    vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                    return vim_item
                end,
            },
            --]]
            formatting = {
                fields = { 'menu', 'abbr', 'kind' },
                format = function(entry, item)
                    local menu_icon = {
                        -- cmp_tabnine = '󰋙',
                        nvim_lsp = '',
                        vsnip = '',
                        buffer = '󰻋',
                        path = '󰨣',
                        calc = '',
                    }

                    --[[ if entry.source.name == "cmp_tabnine" then
                        local detail = (entry.completion_item.labelDetails or {}).detail
                        item.kind = ""
                        if detail and detail:find('.*%%.*') then
                            item.kind = item.kind .. '  ' .. detail
                        end

                        if (entry.completion_item.data or {}).multiline then
                            item.kind = item.kind .. '  ' .. '[ML]'
                        end
                    end ]]

                    item.menu = menu_icon[entry.source.name]
                    item.kind = (icons[item.kind] or item.kind) .. ' ' .. item.kind
                    return item
                end,
            },
            --]]
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

        -- Setup lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        require('lspconfig')['lua_ls'].setup {
            capabilities = capabilities
        }

        vim.g.cmp_debug = true
    end
}
