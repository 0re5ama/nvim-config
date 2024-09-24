return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	ft = "http",
	config = function()
		vim.keymap.set("n", "<leader><space>", ":Rest run<CR>", { desc = "Run HTTP" })

		require("telescope").load_extension("rest")
		-- TODO: Optimize later
		vim.keymap.set("n", "<leader>fh", function()
			require("telescope").extensions.rest.select_env()
		end, { desc = "Insert File name" })
	end,
}
