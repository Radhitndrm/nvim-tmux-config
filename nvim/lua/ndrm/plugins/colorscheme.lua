return {
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					term_colors = true,
					styles = {
						comments = "italic",
						keywords = "bold",
						functions = "bold",
						variables = "NONE",
					},
				},
				-- highlight overrides untuk aksen pink/magenta
				colors = {
					-- overriding palette
					keyword = "#ff55ff",
					functions = "#ff77ff",
					comment = "#ff99ff",
					string = "#ff66aa",
					number = "#ff55ff",
				},
			})

			-- set colorscheme Duskfox (lebih gelap, magenta accent)
			vim.cmd.colorscheme("duskfox")
		end,
	},
}
