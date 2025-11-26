return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:crashdummyy/mason-registry",
			},
			ui = {
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })
	end,
}
