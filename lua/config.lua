local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

o.number = true
o.relativenumber = true
o.hidden = true

-- wo.foldmethod = 'syntax'
o.wrap = false
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.autoindent = true
o.smartindent = true
o.cindent = true

o.wildmenu = true
o.shellslash = true

-- o.mouse = ''

o.hlsearch = true
o.incsearch = true
o.ignorecase = true

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 99
o.termguicolors = true
o.scrolloff = 4
o.updatetime = 50

-- o.colorcolumn = "80"
