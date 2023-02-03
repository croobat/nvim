require("tokyonight").setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
	styles = {
		--Font styles
		comments = "italic",
		keywords = "italic",
		functions = "NONE",
		variables = "NONE",
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help" },
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,

	on_colors = function(colors)
		colors.comment = "#626c9c"
	end,

	on_highlights = function(highlights, colors) end,
})

vim.cmd "colorscheme tokyonight"
