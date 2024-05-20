return {
	"saecki/crates.nvim",
	ft = { "rust", "toml" },
	config = function(_, opts)
		local crates = require("crates")
		crates.setup({
			src = {
				cmp = {
					enabled = true,
				},
			},
			-- null_ls = {
			-- 	enabled = true,
			-- 	name = "crates.nvim",
			-- },
		})
		crates.show()

		local opt = { silent = true }

		vim.keymap.set("n", "<leader>ct", crates.toggle, opt)
		vim.keymap.set("n", "<leader>cr", crates.reload, opt)

		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opt)
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opt)
		vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opt)

		vim.keymap.set("n", "<leader>cu", crates.update_crate, opt)
		vim.keymap.set("v", "<leader>cu", crates.update_crates, opt)
		vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opt)
		vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opt)
		vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opt)
		vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opt)

		vim.keymap.set("n", "<leader>ce", crates.expand_plain_crate_to_inline_table, opt)
		vim.keymap.set("n", "<leader>cE", crates.extract_crate_into_table, opt)

		vim.keymap.set("n", "<leader>cH", crates.open_homepage, opt)
		vim.keymap.set("n", "<leader>cR", crates.open_repository, opt)
		vim.keymap.set("n", "<leader>cD", crates.open_documentation, opt)
		vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opt)
	end,
}
