-- vim.cmd "colorscheme dracula"

local colorscheme = "dracula"

vim.g.dracula_colors = {
  bg = "#282A36",
  comment = "#6b7cb3",
  fg = "#eae6f0",
}


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- transparency
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
