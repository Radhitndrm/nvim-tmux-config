return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
			sidebars = { "qf", "help", "packer" },
			day_brightness = 0.2,
			dim_inactive = false,
		})

		vim.cmd("colorscheme tokyonight")

		-- ✨ Custom warna dari palet yang kamu inginkan
		vim.api.nvim_set_hl(0, "Comment", { fg = "#7ca9c0", italic = true }) -- langit biru
		vim.api.nvim_set_hl(0, "Statement", { fg = "#e94b28", bold = true }) -- api/asap
		vim.api.nvim_set_hl(0, "Function", { fg = "#d6a864" }) -- krem keemasan
		vim.api.nvim_set_hl(0, "Identifier", { fg = "#a67c52" }) -- cokelat kayu
		vim.api.nvim_set_hl(0, "Type", { fg = "#ff6740" }) -- oranye cerah
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e293b" }) -- biru tua
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3f4a62", bg = "none" }) -- garis antar pane
	end,
}
