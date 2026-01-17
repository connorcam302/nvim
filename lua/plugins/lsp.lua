local vscode = require("config.vscode")

return {
	{
		"neovim/nvim-lspconfig",
		enabled = not vscode.is_disabled("nvim-lspconfig"),
		dependencies = {
			{ "williamboman/mason.nvim", opts = { PATH = "append" } },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua", -- make sure fzf-lua is installed
		},
		opts = {
			servers = {
				tailwindcss = {
					-- exclude a filetype from the default_config
					filetypes_exclude = { "markdown" },
					-- add additional filetypes to the default_config
					filetypes_include = {},
					-- to fully override the default_config, change the below
					-- filetypes = {}

					-- additional settings for the server, e.g:
					-- tailwindCSS = { includeLanguages = { someLang = "html" } }
					-- can be addeded to the settings table and will be merged with
					-- this defaults for Phoenix projects
					settings = {
						tailwindCSS = {
							includeLanguages = {
								elixir = "html-eex",
								eelixir = "html-eex",
								heex = "html-eex",
							},
						},
					},
				},
			},
			setup = {
				tailwindcss = function(_, opts)
					opts.filetypes = opts.filetypes or {}

					-- Add default filetypes
					vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

					-- Remove excluded filetypes
					--- @param ft string
					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
					end, opts.filetypes)

					-- Add additional filetypes
					vim.list_extend(opts.filetypes, opts.filetypes_include or {})
				end,
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- Setup Mason
			require("mason").setup({
				PATH = "append",
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls" },
				automatic_installation = true,
				handlers = {
					function(server)
						require("lspconfig")[server].setup({
							capabilities = capabilities,
						})
					end,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.keymap.set("n", "gd", function()
						require("fzf-lua").lsp_definitions()
					end, { desc = "Goto Definition" })
					vim.keymap.set("n", "gr", function()
						require("fzf-lua").lsp_references()
					end, { desc = "Goto References" })
					vim.keymap.set("n", "<leader>sp", function()
						require("fzf-lua").spell_suggest()
					end, { desc = "Spell check" })
				end,
			})

			-- Optional diagnostics icons
			if vim.g.have_nerd_font then
				local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
				local diagnostic_signs = {}
				for type, icon in pairs(signs) do
					diagnostic_signs[vim.diagnostic.severity[type]] = icon
				end
				vim.diagnostic.config({ signs = { text = diagnostic_signs } })
			end
		end,
	},
}
