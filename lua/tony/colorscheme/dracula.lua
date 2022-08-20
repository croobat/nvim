local colorscheme = "dracula"

vim.g.dracula_colors = {
  bg = "#282A36",
  comment = "#6b7cb3",
  fg = "#eae6f0",
}

vim.cmd "colorscheme dracula"

-- transparency
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"

