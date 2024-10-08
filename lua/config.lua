local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

vim.g.mapleader = ","

-- lazy.setup("plugins")

lazy.setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	ui = {
		border = "single",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.keymap.set("n", "<leader>zz", "<cmd>Lazy<cr>", { desc = "Lazy" })

vim.o.number = true
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

-- o.mouse = ''

o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.termguicolors = true
o.scrolloff = 4
o.updatetime = 50

o.guifont = "FiraCode Nerd Font Mono:h10"
-- o.guibg= "#000000"
g.neovide_transparency = 0.8

-- o.colorcolumn = "80"
