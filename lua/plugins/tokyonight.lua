require("tokyonight").setup({
	style = "night",
	on_colors = function(colors)
		colors.comment = "#626c9c"
	end,
})

vim.cmd([[colorscheme tokyonight]])
