local keymap = vim.api.nvim_set_keymap

keymap("n", "<space>", "za", {})
keymap("v", "<space>", "za", {})

vim.g.mapleader = ","

local opts = { noremap = true }

local function nmap(key, map)
	keymap("n", key, map, opts)
end

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to primary cliboard" })
vim.keymap.set("n", "<leader>p", '"+p:%s/<c-v><cr>//<cr>==', { desc = "Paste from primary cliboard" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Visual copy to primary cliboard" })
vim.keymap.set("v", "<leader>p", '"+p:%s/<c-v><cr>//<cr>==', { desc = "Visual paste from primary cliboard" })

vim.keymap.set("n", "<leader>fn", 'a<C-R>=expand("%:t:r")<cr><esc>', { desc = "Insert File name" })

vim.keymap.set("n", "<leader><space>", function()
	local strr = vim.fn.input("Path to dll ", vim.fn.getcwd() .. "/bin/Debug/", "file")
	vim.notify(strr)
end)
