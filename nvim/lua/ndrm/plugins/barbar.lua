return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- ikon untuk buffer
	},
	init = function()
		vim.g.barbar_auto_setup = false -- biar kita atur manual
	end,
	opts = {},
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
		})
	end,
}
