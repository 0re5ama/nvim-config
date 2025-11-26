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
		{
			"<leader>rp",
			"<cmd>lua require('telescope').extensions.projects.projects{}<cr>",
			desc = "Telescope Planets",
		},
		{ "<leader>ft", ":TodoTelescope<cr>" },
		{ "<leader>fd", ":Telescope diagnostics<cr>" },
		{ "gr", ":Telescope lsp_references<cr>" },
		{ "gd", ":Telescope lsp_definitions<cr>" },
		{ "gi", ":Telescope lsp_implementations<cr>" },
		{ "gs", ":Telescope lsp_workspace_symbols<cr>" },
		{ "<leader>fs", ":Telescope lsp_document_symbols<cr>" },
		{ "<leader>ls", ":Telescope lsp_dynamic_workspace_symbols<cr>" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({
					patterns = {
						">dev",
						">.config",
						".git",
						"_darcs",
						".hg",
						".bzr",
						".svn",
						"Makefile",
						"package.json",
					},
				})
				require("telescope").load_extension("projects")
				require("nvim-tree").setup({
					sort_by = "case_sensitive",
					view = {
						adaptive_size = true,
					},
					renderer = {
						group_empty = true,
					},
					filters = {
						dotfiles = false,
						custom = { ".git" },
						exclude = { "appsettings*", ".env*" },
					},

					sync_root_with_cwd = true,
					respect_buf_cwd = true,
					update_focused_file = {
						enable = true,
						update_root = true,
					},
				})
			end,
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"%__virtual.cs$",
			},
			mappings = {
				i = {
					["<C-u>"] = false,
				},
			},
			-- vimgrep_arguments = { "--files", "--hidden", "--glob", "!**/.git/*" },
		},
		pickers = {
			live = false,
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
		scroll = { enabled = false },
	},
}
