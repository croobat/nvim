require "tony.options"
require "tony.keymaps"

require "tony.plugins"

require "tony.autocommands"

require "tony.color.tokyonight"

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
