--[[ require'telescope'.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '-uu' -- **This is the added flag**
        }
    }
} ]]

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
-- local actions = require'telescope.actions'

local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
--table.insert(vimgrep_arguments, "--smart-case")
--table.insert(vimgrep_arguments, "--line-number")
--table.insert(vimgrep_arguments, "--column")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
            },
        },
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
}
