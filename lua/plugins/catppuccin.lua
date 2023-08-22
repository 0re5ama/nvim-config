return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require 'catppuccin'.setup {
            flavour = 'mocha',
            no_italic = true,
        }
        vim.cmd('colorscheme catppuccin')
    end,
}
-- something
