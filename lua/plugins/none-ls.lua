return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function(_, opts)
		local null_ls = require("null-ls")

		local nls = require("null-ls").builtins
		opts.sources = vim.list_extend(opts.sources or {}, {
			nls.formatting.biome,

			-- or if you like to live dangerously like me:
			nls.formatting.biome.with({
				args = {
					"check",
					"--apply-unsafe",
					"--formatter-enabled=true",
					"--organize-imports-enabled=true",
					"--skip-errors",
					"$FILENAME",
				},
			}),
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"),
			},
		})
	end,
}
