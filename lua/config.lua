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

vim.g.bomb = false

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

o.guifont = "FiraCode Nerd Font Mono:h11"
-- o.guibg= "#000000"
g.neovide_transparency = 0.8

-- o.colorcolumn = "80"

-- Neovide configs
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 4.2
-- vim.g.neovide_cursor_vfx_particle_density = 100.0
vim.g.neovide_cursor_vfx_particle_speed = 36.0
vim.g.neovide_cursor_vfx_particle_phase = 1000000
-- vim.g.neovide_cursor_vfx_particle_curl = 10.0

-- Rustaceanvim
vim.g.rustaceanvim = {
	tools = {
		float_win_config = {
			border = "rounded",
		},
	},
	server = {
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
			vim.lsp.inlay_hint.enable(true)
		end,
		--     settings = {
		--       -- rust-analyzer language server configuration
		--       ["rust-analyzer"] = {},
		--     },
		--   },
		--   -- DAP configuration
		--   dap = {},
	},
}

o.guifont = "FiraCode Nerd Font Mono:h12"
if vim.g.started_by_nvim == true then
	o.guifont = "FiraCode Nerd Font Mono:h20"
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})

-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<M-CR>", 'copilot#Accept("<CR>")', {
	silent = true,
	expr = true,
	script = true,
	desc = "Accept Copilot suggestion",
})
