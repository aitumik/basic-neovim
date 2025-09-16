return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			-- languages you want installed
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"yaml",
				"go",
			},
			sync_install = false,
			auto_install = true, -- install missing parsers automatically

			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
