return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Installer for LSP servers
		"williamboman/mason-lspconfig.nvim", -- Bridge Mason <-> lspconfig
	},
	config = function()
		-- Setup Mason
		require("mason").setup()

		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error under cursor" })

		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focus = false })
			end,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls", -- TypeScript / JavaScript
				"lua_ls", -- Lua
				"pyright", -- Python
				"gopls", -- Go
			},
		})

		local lspconfig = require("lspconfig")

		-- Default keymaps for navigation
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Find references
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Hover docs
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- Signature help
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
			vim.keymap.set("n", "<C-o>", "<C-t>", opts) -- Jump back

			-- Format on save (especially for Go auto-imports)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end

		-- Setup servers
		local servers = { "ts_ls", "lua_ls", "pyright", "gopls" }
		for _, server in ipairs(servers) do
			local opts = { on_attach = on_attach }

			if server == "gopls" then
				opts.settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true, -- use stricter formatting
					},
				}
			end

			lspconfig[server].setup(opts)
		end
	end,
}
