-- Tokyo night
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { comment = "#626c9c", }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

-- transparency
-- vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
