vim.g.mapleader = ','

local keymap = vim.api.nvim_set_keymap

keymap('n', '<space>', 'za', {})
keymap('v', '<space>', 'za', {})

vim.g.mapleader = ','

local opts = { noremap = true }

local function nmap(key, map)
    keymap('n', key, map, opts)
end

-- Telescope
nmap('<leader>?', "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nmap('<leader><space>', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Nvim Tree
nmap('<leader>n', ':NvimTreeToggle<cr>')
nmap('<leader>N', ':NvimTreeFindFile<cr>')

-- LazyGit
nmap('<leader>gg', ':LazyGit<cr>')

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
--[[vim.keymap.set('', 'f', function()
    hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true
    }
end, { remap = true })
vim.keymap.set('', 'F', function()
    hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true
    }
end, { remap = true })
vim.keymap.set('', 't', function()
    hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1
    }
end, { remap = true })
vim.keymap.set('', 'T', function()
    hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1 }
end, { remap = true })]]
vim.keymap.set('', '<leader>h', function()
    hop.hint_words({ current_line_only = false })
end, { remap = true })
vim.keymap.set('', '<leader>/', function()
    hop.hint_patterns({ current_line_only = false })
end, { remap = true })

nmap("<C-u>", "<C-u>zz");
nmap("<C-d>", "<C-d>zz");

vim.keymap.set('n', '<leader><space>', function()
    local strr = vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    vim.notify(strr)
end)
