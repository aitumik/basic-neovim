return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- format before saving
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "jq" },
				go = { "gofmt" },
				-- add more filetypes/formatters here
			},
			-- run formatter on save
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
