return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				dart = { lsp_format = "fallback" },
				razor = { lsp_format = "fallback" },
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				yml = { "yamlfmt", lsp_format = "fallback" },
				toml = { "taplo", lsp_format = "fallback" },
				rust = { "rustfmt", lsp_format = "fallback" },
				zig = { "zigfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				jsonc = {
					"biome",
					"jq",
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				json = {
					"biome",
					"jq",
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				javascript = { "biome", "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				svelte = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				typescript = {
					"biome-check",
					"biome",
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				typescriptreact = {
					"biome-check",
					"biome",
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				tex = { "latexindent", lsp_format = "fallback" },
				plaintex = { "latexindent", lsp_format = "fallback" },
				cs = { "csharpier", lsp_format = "fallback" },
				-- cs = { lsp_format = "fallback" },
				handlebars = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				markdown = { "prettierd", lsp_format = "fallback" },
				html = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				less = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
				css = {
					"cssbiome",
					"prettierd",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				scss = {
					"prettierd",
					"biome",
					"prettier",
					stop_after_first = true,
					lsp_format = "fallback",
				},
				xmllint = { "xmllint", lsp_format = "fallback" },
				-- sql = { "pg_format", lsp_format = "fallback" },
			},
		})
		vim.keymap.set("n", "<leader>F", function()
			conform.format()
		end, { desc = "Format document with conform" })
	end,
}
