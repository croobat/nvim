require("tokyonight").setup({
	style = "night",
	on_colors = function(colors)
		colors.comment = "#626c9c"
		colors.green = "#a8d27b"
	end,
})

vim.cmd([[colorscheme tokyonight]])
