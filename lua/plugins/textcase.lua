return {
    "johmsalas/text-case.nvim",
    config = function()
        local textcase = require('textcase')
        textcase.setup {}
        vim.keymap.set('n', 'gau', function() textcase.current_word('to_upper_case') end)
        vim.keymap.set('n', 'gal', function() textcase.current_word('to_lower_case') end)
        vim.keymap.set('n', 'gas', function() textcase.current_word('to_snake_case') end)
        vim.keymap.set('n', 'gad', function() textcase.current_word('to_dash_case') end)
        vim.keymap.set('n', 'gan', function() textcase.current_word('to_constant_case') end)
        vim.keymap.set('n', 'gad', function() textcase.current_word('to_dot_case') end)
        vim.keymap.set('n', 'gaa', function() textcase.current_word('to_phrase_case') end)
        vim.keymap.set('n', 'gac', function() textcase.current_word('to_camel_case') end)
        vim.keymap.set('n', 'gap', function() textcase.current_word('to_pascal_case') end)
        vim.keymap.set('n', 'gat', function() textcase.current_word('to_title_case') end)
        vim.keymap.set('n', 'gaf', function() textcase.current_word('to_path_case') end)
    end,
}
