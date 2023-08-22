return {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
        'kyazdani42/nvim-web-devicons',
    },
    -- tag = 'nightly',
    keys = {
        { '<leader>n', ':NvimTreeToggle<cr>', desc = 'Nvim Tree Toggle' },
        { '<leader>N', ':NvimTreeFindFile<cr>', desc = 'Nvim Find Current File' },
    },
    config = {
        sort_by = 'case_sensitive',
        view = {
            adaptive_size = true,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    }
}
