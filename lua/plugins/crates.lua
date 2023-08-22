return {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function(_, opts)
        local crates = require 'crates'
        crates.setup(opts)
        crates.show()
        vim.keymap.set('n', '<leader>U', function()
            crates.upgrade_all_crates()
        end, { remap = true })
    end,
}
