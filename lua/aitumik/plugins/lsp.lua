return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Installer for LSP servers
		"williamboman/mason-lspconfig.nvim", -- Bridge Mason <-> lspconfig
	},
	config = function()
		-- Setup Mason
		require("mason").setup()
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
		end

		-- Setup servers
		local servers = { "ts_ls", "lua_ls", "pyright", "gopls" }
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				on_attach = on_attach,
			})
		end
	end,
}
