return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			background = {
				light = "latte",
				dark = "mocha",
			},
			integrations = {
				nvimtree = true,
			},
			highlight_overrides = {
				mocha = function(mocha)
					return {
						-- NvimTree
						NvimTreeNormal = { bg = mocha.none },

						-- Generic floats
						NormalFloat = { bg = mocha.none },
						FloatBorder = { bg = mocha.none },

						-- Completion menu
						-- Pmenu = { bg = mocha.none },
						-- PmenuSel = { bg = mocha.none },
						-- PmenuSbar = { bg = mocha.none },
						-- PmenuThumb = { bg = mocha.none },

						-- Diagnostics hover
						DiagnosticFloatingError = { bg = mocha.none },
						DiagnosticFloatingWarn = { bg = mocha.none },
						DiagnosticFloatingInfo = { bg = mocha.none },
						DiagnosticFloatingHint = { bg = mocha.none },

						-- Snacks popups
						SnacksNormal = { bg = mocha.none },
						SnacksBorder = { bg = mocha.none },
						SnacksInput = { bg = mocha.none },
						SnacksPrompt = { bg = mocha.none },
						SnacksPreview = { bg = mocha.none },

						-- Telescope popups
						TelescopeNormal = { bg = mocha.none },
						TelescopeBorder = { bg = mocha.none },
						TelescopePromptNormal = { bg = mocha.none },
						TelescopePromptBorder = { bg = mocha.none },
						TelescopeResultsNormal = { bg = mocha.none },
						TelescopeResultsBorder = { bg = mocha.none },
						TelescopePreviewNormal = { bg = mocha.none },
						TelescopePreviewBorder = { bg = mocha.none },

						MarkdownCode = { bg = mocha.none },
						MarkdownCodeBlock = { bg = mocha.none },
						markdownCode = { bg = mocha.none },
						markdownCodeBlock = { bg = mocha.none },
					}
				end,
			},
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
