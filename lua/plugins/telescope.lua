return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = "Telescope Old Files" },
		-- { '<leader><space>', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Telescope Buffers' },
		{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Telescope Files" },
		{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Telescope Grep" },
		{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Telescope Buffers" },
		{ "<leader>f?", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Telescope Help" },
		{ "<leader>fp", "<cmd>lua require('telescope.builtin').planets()<cr>", desc = "Telescope Planets" },
		{ "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = "Telescope Planets" },
		{ "<leader>ft", ":TodoTelescope<cr>" },
		{ "gr", ":Telescope lsp_references<cr>" },
		{ "gd", ":Telescope lsp_definitions<cr>" },
		{ "gi", ":Telescope lsp_implementations<cr>" },
		{ "gs", ":Telescope lsp_workspace_symbols<cr>" },
		{ "<leader>ls", ":Telescope lsp_dynamic_workspace_symbols<cr>" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
			},
			mappings = {
				i = {
					["<C-u>"] = false,
				},
			},
			-- vimgrep_arguments = { "--files", "--hidden", "--glob", "!**/.git/*" },
		},
		pickers = {
			find_files = {
				-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				-- also ~/.ripgreprc is added with --ignore-file=$HOME/.ignore which has !**/.env* and !**/appsettings*
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
			},
		},
	},
}
