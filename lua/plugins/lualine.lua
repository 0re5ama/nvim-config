local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

return {
    'nvim-lualine/lualine.nvim',
    config = {
        options = { theme = 'palenight' },
        -- options = { theme  = 'papercolor_light' },
        -- options = { theme  = 'papercolor_dark' },
        sections = {
            lualine_b = {
                'branch',
                'diff',
                -- this was only because font didn't load for default one
                {
                    'diagnostics',
                    sources = { 'nvim_diagnostic' },
                    symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
                    diagnostics_color = {
                        color_error = { fg = colors.red },
                        color_warn = { fg = colors.yellow },
                        color_info = { fg = colors.cyan },
                    },
                },
                {
                    -- Lsp server name
                    function()
                        local msg = 'No Active Lsp'
                        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = '',
                    color = { fg = colors.fg, gui = 'bold' },
                },
            },
            lualine_x = {
                'encoding',
                'fileformat',
                'filetype',
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#ff9e64" },
                },
            },
        }
    }
}
