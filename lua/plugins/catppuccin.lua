return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background_color = "#00000000",
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,

			integrations = {
				nvimtree = true,
			},
			highlight_overrides = {
				mocha = function(mocha)
					return {
						NvimTreeNormal = { bg = mocha.none },
					}
				end,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
-- something
--
--
