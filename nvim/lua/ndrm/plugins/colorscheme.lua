return {
	{
		"AlexvZyl/nordic.nvim",
		name = "nordic",
		priority = 1000,
		config = function()
			require("nordic").setup({
				-- Konfigurasi opsional
				italic_comments = true,
				bold_keywords = false,
				transparent = {
					bg = true, -- true kalau mau background transparan
					float = false,
				},
				reduced_blue = true,
				cursorline = {
					bold = false,
					bold_number = true,
					theme = "dark",
					blend = 0.85,
				},
				noice = { style = "classic" },
				telescope = { style = "flat" },
				leap = { dim_backdrop = false },
				ts_context = { dark_background = true },
			})

			-- set colorscheme
			vim.cmd.colorscheme("nordic")
		end,
	},
}
