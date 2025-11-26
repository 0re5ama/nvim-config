return {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	-- tag = 'nightly',
	keys = {
		{ "<leader>n", ":NvimTreeToggle<cr>", desc = "Nvim Tree Toggle" },
		{ "<leader>N", ":NvimTreeFindFile<cr>", desc = "Nvim Find Current File" },
	},
	config = function()
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
		})
	end,
}
