return {
	"neovim/nvim-lspconfig",
	depenedencies = {
		"nvim-telescope/telescope.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		-- Setup language servers.
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		lspconfig.prismals.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		lspconfig.sourcekit.setup({})

		-- 	lspconfig.angularls.setup({
		-- 		capabilities = capabilities,
		-- 		root_dir = function()
		-- 			return vim.loop.cwd()
		-- 		end,
		-- 	})

		lspconfig.zls.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		local words = {}
		for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
			table.insert(words, word)
		end

		-- TODO: Add words to dictionary
		lspconfig.ltex.setup({
			capabilities = capabilities,
			settings = {
				ltex = {
					dictionary = {
						["en-US"] = words,
					},
				},
			},
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
		lspconfig.texlab.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
		lspconfig.svelte.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		lspconfig.biome.setup({
			capabilities = capabilities,

			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "css", "html" },
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local configs = require("lspconfig.configs")
		if not configs.ls_emmet then
			configs.ls_emmet = {
				default_config = {
					cmd = { "ls_emmet", "--stdio" },
					filetypes = {
						"html",
						"css",
						"scss",
						"javascriptreact",
						"typescriptreact",
						"haml",
						"xml",
						"xsl",
						"pug",
						"slim",
						"sass",
						"stylus",
						"less",
						"sss",
						"hbs",
						"handlebars",
					},
					root_dir = function(fname)
						return vim.loop.cwd()
					end,
					settings = {},
				},
			}
		end

		lspconfig.ls_emmet.setup({ capabilities = capabilities })

		local border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" },
		}

		local _border = "rounded"

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = border,
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = border,
		})

		-- LSP settings (for overriding per client)
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		local on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
		end

		-------------- lua --------------
		lspconfig.lua_ls.setup({
			handlers = handlers,
		})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover({ border = "single" })
				end, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				-- vim.keymap.set("n", "<leader>fs", vim.lsp.buf.document_symbol, opts)
				-- vim.keymap.set("n", "<leader>fS", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "==", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format document with LSP" })
			end,
		})

		local sign = function(opts)
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = "",
			})
		end

		sign({ name = "DiagnosticSignError", text = "" })
		sign({ name = "DiagnosticSignWarn", text = "" })
		sign({ name = "DiagnosticSignHint", text = "" })
		sign({ name = "DiagnosticSignInfo", text = "󰋽" })

		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = false,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.cmd([[
        set signcolumn=yes
        autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
        ]])

		-- Set completeopt to have a better completion experience
		-- :help completeopt
		-- menuone: popup even when there's only one match
		-- noinsert: Do not insert text until a selection is made
		-- noselect: Do not select, force to select one from the menu
		-- shortness: avoid showing extra messages when using completion
		-- updatetime: set updatetime for CursorHold
		vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
		vim.opt.shortmess = vim.opt.shortmess + { c = true }
		vim.api.nvim_set_option("updatetime", 500)

		-- Fixed column for diagnostics to appear
		-- Show autodiagnostic popup on cursor hover_range
		-- Goto previous / next diagnostic warning / error
		-- Show inlay_hints more frequently
		-- vim.cmd([[
		-- set signcolumn=yes
		-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
		-- ]])
	end,
}
