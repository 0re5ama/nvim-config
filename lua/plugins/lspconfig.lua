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

		lspconfig.biome.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		lspconfig.angularls.setup({
			capabilities = capabilities,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

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
		lspconfig.ltex.setup({
			capabilities = capabilities,
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

		-- LSP settings (for overriding per client)
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		local dotnet_handlers = {
			["textDocument/definition"] = require("omnisharp_extended").definition_handler,
			["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
			["textDocument/references"] = require("omnisharp_extended").references_handler,
			["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		local on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
		end

		-------------- C# --------------
		local pid = vim.fn.getpid()
		local omnisharp_bin = "/home/xer0/.local/share/nvim/mason/bin/omnisharp"
		-- local omnisharp_bin = "/home/xer0/.local/share/omnisharp/OmniSharp"

		lspconfig.omnisharp.setup({
			-- on_attach = on_attach,
			-- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
			cmd = { omnisharp_bin },
			handlers = dotnet_handlers,
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		-- lspconfig.omnisharp.setup({
		-- 	capabilities = capabilities,
		-- 	-- cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
		-- 	cmd = { "/home/xer0/.local/share/nvim/mason/bin/omnisharp" },
		-- 	enable_import_completion = false,
		-- 	organize_imports_on_format = false,
		-- 	enable_roslyn_analyzers = false,
		-- 	root_dir = function()
		-- 		return vim.loop.cwd() -- current working directory
		-- 	end,
		-- })

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
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>fs", vim.lsp.buf.document_symbol, opts)
				vim.keymap.set("n", "<leader>fS", vim.lsp.buf.workspace_symbol, opts)
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
